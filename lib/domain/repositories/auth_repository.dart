import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../../core/errors/failures.dart';

/// Authentication repository interface
abstract class AuthRepository {
  /// Login with email/username and password
  Future<Either<Failure, UserEntity>> login({
    required String emailOrUsername,
    required String password,
  });

  /// Register new user
  Future<Either<Failure, UserEntity>> register({
    required String username,
    required String email,
    required String password,
  });

  /// Login with phone number (OTP)
  Future<Either<Failure, String>> sendOtp(String phoneNumber);
  
  Future<Either<Failure, UserEntity>> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  /// Get current user
  Future<Either<Failure, UserEntity>> getCurrentUser();

  /// Logout
  Future<Either<Failure, void>> logout();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();

  /// Get auth token
  Future<String?> getToken();
}
