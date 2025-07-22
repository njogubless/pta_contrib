// lib/features/contributions/providers/contributions_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pta_contrib/Features/Auth/Domain/providers/auth_provider.dart';
import 'package:pta_contrib/Features/Payments/data/model/contribution.dart';
import 'package:pta_contrib/Features/Payments/service/mpesa_Service/mpesa_service_provider.dart';
import 'package:pta_contrib/Features/Projects/Domain/providers/project_providers.dart';
import 'package:pta_contrib/services/firebase/firebase_service.dart';
import 'package:uuid/uuid.dart';


// Contributions repository provider
final contributionsRepositoryProvider = Provider<ContributionsRepository>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return ContributionsRepository(firebaseService);
});

// M-Pesa service provider
final mpesaServiceProvider = Provider<MpesaService>((ref) {
  return MpesaService();
});

// Project contributions stream provider
final projectContributionsProvider = StreamProvider.family<List<Contribution>, String>((ref, projectId) {
  final repository = ref.watch(contributionsRepositoryProvider);
  return repository.projectContributionsStream(projectId);
});

// User contributions stream provider
final userContributionsProvider = StreamProvider.family<List<Contribution>, String>((ref, userId) {
  final repository = ref.watch(contributionsRepositoryProvider);
  return repository.userContributionsStream(userId);
});

// Project contribution summary provider
final projectContributionSummaryProvider = FutureProvider.family<Map<String, double>, String>((ref, projectId) {
  final repository = ref.watch(contributionsRepositoryProvider);
  return repository.getProjectContributionSummary(projectId);
});

// Contributions controller provider
final contributionsControllerProvider = StateNotifierProvider<ContributionsController, ContributionsState>((ref) {
  final repository = ref.watch(contributionsRepositoryProvider);
  final mpesaService = ref.watch(mpesaServiceProvider);
  final projectsRepository = ref.watch(projectsRepositoryProvider);
  return ContributionsController(repository, mpesaService, projectsRepository);
});

class ContributionsRepository {
  final FirebaseService _firebaseService;

  ContributionsRepository(this._firebaseService);

  Future<void> createContribution(Contribution contribution) {
    return _firebaseService.createContribution(contribution);
  }

  Future<void> updateContribution(Contribution contribution) {
    return _firebaseService.updateContribution(contribution);
  }

  Stream<List<Contribution>> projectContributionsStream(String projectId) {
    return _firebaseService.projectContributionsStream(projectId);
  }

  Stream<List<Contribution>> userContributionsStream(String userId) {
    return _firebaseService.userContributionsStream(userId);
  }

  Future<Map<String, double>> getProjectContributionSummary(String projectId) {
    return _firebaseService.getProjectContributionSummary(projectId);
  }
}

class ContributionsController extends StateNotifier<ContributionsState> {
  final ContributionsRepository _repository;
  final MpesaService _mpesaService;
  final ProjectsRepository _projectsRepository;
  final _uuid = const Uuid();

  ContributionsController(this._repository, this._mpesaService, this._projectsRepository) 
      : super(const ContributionsState.initial());

  Future<void> contributeToProject({
    required String projectId,
    required String userId,
    required double amount,
    required String phoneNumber,
    String? message,
    bool isAnonymous = false,
  }) async {
    state = const ContributionsState.loading();
    
    try {
      // Create pending contribution
      final contribution = Contribution(
        id: _uuid.v4(),
        projectId: projectId,
        userId: userId,
        amount: amount,
        status: ContributionStatus.pending,
        paymentMethod: PaymentMethod.mpesa,
        message: message,
        isAnonymous: isAnonymous,
        createdAt: DateTime.now(),
      );

      await _repository.createContribution(contribution);

      // Initiate M-Pesa STK push
      final mpesaResult = await _mpesaService.initiateSTKPush(
        phoneNumber: phoneNumber,
        amount: amount,
        accountReference: projectId,
        transactionDesc: 'Contribution to project',
      );

      if (mpesaResult.success) {
        // Update contribution with transaction ID
        final updatedContribution = contribution.copyWith(
          transactionId: mpesaResult.checkoutRequestId,
        );
        await _repository.updateContribution(updatedContribution);

        state = ContributionsState.stkPushSent(
          contribution: updatedContribution,
          checkoutRequestId: mpesaResult.checkoutRequestId!,
        );

        // Start polling for payment status
        _pollPaymentStatus(updatedContribution);
      } else {
        // Update contribution as failed
        final failedContribution = contribution.copyWith(
          status: ContributionStatus.failed,
          failureReason: mpesaResult.errorMessage,
        );
        await _repository.updateContribution(failedContribution);
        
        state = ContributionsState.error(mpesaResult.errorMessage ?? 'Payment initiation failed');
      }
    } catch (e) {
      state = ContributionsState.error('Failed to process contribution: $e');
    }
  }

  Future<void> _pollPaymentStatus(Contribution contribution) async {
    if (contribution.transactionId == null) return;

    int pollCount = 0;
    const maxPolls = 30; // Poll for 5 minutes (10 seconds * 30)
    
    while (pollCount < maxPolls) {
      await Future.delayed(const Duration(seconds: 10));
      
      try {
        final status = await _mpesaService.queryTransactionStatus(
          contribution.transactionId!,
        );

        if (status.isCompleted) {
          await _handleSuccessfulPayment(contribution, status.mpesaReceiptNumber);
          break;
        } else if (status.isFailed) {
          await _handleFailedPayment(contribution, status.errorMessage);
          break;
        }
        
        pollCount++;
      } catch (e) {
        // Continue polling on error
        pollCount++;
      }
    }

    // If we've exhausted all polls and still no definitive status
    if (pollCount >= maxPolls) {
      await _handleFailedPayment(contribution, 'Payment timeout - please check your M-Pesa messages');
    }
  }

  Future<void> _handleSuccessfulPayment(Contribution contribution, String? mpesaReceiptNumber) async {
    try {
      // Update contribution status
      final completedContribution = contribution.copyWith(
        status: ContributionStatus.completed,
        completedAt: DateTime.now(),
        transactionId: mpesaReceiptNumber ?? contribution.transactionId,
      );
      await _repository.updateContribution(completedContribution);

      // Update project current amount
      final project = await _projectsRepository.getProject(contribution.projectId);
      if (project != null) {
        final updatedProject = project.copyWith(
          currentAmount: project.currentAmount + contribution.amount,
          contributorCount: project.contributorCount + 1,
          updatedAt: DateTime.now(),
        );
        await _projectsRepository.updateProject(updatedProject);
      }

      state = ContributionsState.success(
        'Contribution successful! Thank you for your support.',
        completedContribution,
      );
    } catch (e) {
      state = ContributionsState.error('Payment completed but failed to update records: $e');
    }
  }

  Future<void> _handleFailedPayment(Contribution contribution, String? errorMessage) async {
    try {
      final failedContribution = contribution.copyWith(
        status: ContributionStatus.failed,
        failureReason: errorMessage ?? 'Payment failed',
      );
      await _repository.updateContribution(failedContribution);

      state = ContributionsState.error(errorMessage ?? 'Payment failed');
    } catch (e) {
      state = ContributionsState.error('Payment failed and unable to update records: $e');
    }
  }

  Future<void> retryContribution(String contributionId) async {
    state = const ContributionsState.loading();
    
    try {
      // This would involve re-initiating the payment process
      // Implementation depends on your specific retry logic
      state = const ContributionsState.error('Retry functionality not yet implemented');
    } catch (e) {
      state = ContributionsState.error('Failed to retry contribution: $e');
    }
  }

  void clearState() {
    state = const ContributionsState.initial();
  }
}

// Contributions State using freezed
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contributions_state.freezed.dart';

@freezed
class ContributionsState with _$ContributionsState {
  const factory ContributionsState.initial() = ContributionsStateInitial;
  const factory ContributionsState.loading() = ContributionsStateLoading;
  const factory ContributionsState.stkPushSent({
    required Contribution contribution,
    required String checkoutRequestId,
  }) = ContributionsStateStkPushSent;
  const factory ContributionsState.success(String message, Contribution contribution) = ContributionsStateSuccess;
  const factory ContributionsState.error(String message) = ContributionsStateError;
}