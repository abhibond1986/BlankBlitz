import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/datasources/remote/cloudflare_auth_datasource.dart';
import '../../data/datasources/local/local_storage_datasource.dart';
import '../../core/network/api_client.dart';

// Dependencies
final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final localStorageProvider = Provider<LocalStorageDataSource>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  if (prefs == null) throw Exception('SharedPreferences not initialized');
  return LocalStorageDataSource(sharedPreferences: prefs);
});

final cloudflareAuthDataSourceProvider = Provider<CloudflareAuthDataSource>((ref) {
  return CloudflareAuthDataSource(
    apiClient: ref.watch(apiClientProvider),
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(cloudflareAuthDataSourceProvider),
    localDataSource: ref.watch(localStorageProvider),
  );
});

// Auth State
class AuthState {
  final UserEntity? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    UserEntity? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

// Auth Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final isAuth = await _authRepository.isAuthenticated();
    if (isAuth) {
      final result = await _authRepository.getCurrentUser();
      result.fold(
        (failure) => state = state.copyWith(isAuthenticated: false),
        (user) => state = state.copyWith(
          user: user,
          isAuthenticated: true,
        ),
      );
    }
  }

  Future<void> login({
    required String emailOrUsername,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _authRepository.login(
      emailOrUsername: emailOrUsername,
      password: password,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (user) => state = state.copyWith(
        user: user,
        isLoading: false,
        isAuthenticated: true,
        error: null,
      ),
    );
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _authRepository.register(
      username: username,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (user) => state = state.copyWith(
        user: user,
        isLoading: false,
        isAuthenticated: true,
        error: null,
      ),
    );
  }

  Future<void> logout() async {
    await _authRepository.logout();
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
