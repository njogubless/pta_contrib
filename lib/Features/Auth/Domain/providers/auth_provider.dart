
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Firebase service provider
final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseServiceImpl();
});

// Auth state provider
final authStateProvider = StreamProvider<User?>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return firebaseService.authStateChanges();
});

// Current user provider
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) => user,
    loading: () => null,
    error: (_, __) => null,
  );
});

// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return AuthRepository(firebaseService);
});

// Auth controller provider
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository);
});

class AuthRepository {
  final FirebaseService _firebaseService;

  AuthRepository(this._firebaseService);

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    return await _firebaseService.signInWithEmailAndPassword(email, password);
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password, String name) async {
    return await _firebaseService.createUserWithEmailAndPassword(email, password, name);
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }

  Stream<User?> authStateChanges() {
    return _firebaseService.authStateChanges();
  }
}

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(const AuthState.initial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AuthState.loading();
    try {
      final user = await _authRepository.signInWithEmailAndPassword(email, password);
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.error('Sign in failed');
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password, String name) async {
    state = const AuthState.loading();
    try {
      final user = await _authRepository.createUserWithEmailAndPassword(email, password, name);
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.error('Account creation failed');
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    state = const AuthState.loading();
    try {
      await _authRepository.signOut();
      state = const AuthState.unauthenticated();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void clearError() {
    if (state is AuthStateError) {
      state = const AuthState.initial();
    }
  }
}

// Auth State using freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pta_contrib/services/firebase/firebase_service.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated(User user) = AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.error(String message) = AuthStateError;
}