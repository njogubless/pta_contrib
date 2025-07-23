// lib/shared/models/contribution.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

@freezed
class Contribution with _$Contribution {
  const factory Contribution({
    required String id,
    required String projectId,
    required String userId,
    required double amount,
    required ContributionStatus status,
    required PaymentMethod paymentMethod,
    String? transactionId,
    String? message,
    String? receiptUrl,
    required DateTime createdAt,
    DateTime? completedAt,
    String? failureReason,
    @Default(false) bool isAnonymous,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);
}

enum ContributionStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

enum PaymentMethod {
  @JsonValue('mpesa')
  mpesa,
  @JsonValue('card')
  card,
  @JsonValue('bank')
  bank,
}