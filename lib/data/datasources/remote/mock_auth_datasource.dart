import '../../models/user_model.dart';
import '../../../core/errors/failures.dart';

/// Mock authentication data source for development without backend
class MockAuthDataSource {
  MockAuthDataSource();

  Future<UserModel> login({
    required String emailOrUsername,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Mock validation - accept any non-empty credentials
    if (emailOrUsername.isEmpty || password.isEmpty) {
      throw const ServerFailure('Invalid credentials');
    }

    // Return mock user
    return UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      username: emailOrUsername.contains('@')
          ? emailOrUsername.split('@')[0]
          : emailOrUsername,
      email: emailOrUsername.contains('@')
          ? emailOrUsername
          : '$emailOrUsername@example.com',
      rank: 'GOLD',
      level: 15,
      xp: 3500,
      coins: 1250,
      gems: 50,
      avatarUrl: null,
      wins: 28,
      losses: 14,
      totalMatches: 42,
      typingSpeed: 85.5,
      accuracy: 96.5,
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      lastLogin: DateTime.now(),
    );
  }

  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // Mock validation
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      throw const ServerFailure('All fields are required');
    }

    if (password.length < 6) {
      throw const ServerFailure('Password must be at least 6 characters');
    }

    // Return new mock user
    return UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      username: username,
      email: email,
      rank: 'BRONZE',
      level: 1,
      xp: 0,
      coins: 100, // Starting coins
      gems: 0,
      avatarUrl: null,
      wins: 0,
      losses: 0,
      totalMatches: 0,
      typingSpeed: 0.0,
      accuracy: 0.0,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    );
  }

  Future<UserModel> getCurrentUser(String token) async {
    await Future.delayed(const Duration(milliseconds: 300));

    // Return mock current user based on token
    return UserModel(
      id: token,
      username: 'Player_${token.substring(0, 5)}',
      email: 'player@example.com',
      rank: 'SILVER',
      level: 10,
      xp: 2000,
      coins: 500,
      gems: 25,
      avatarUrl: null,
      wins: 15,
      losses: 10,
      totalMatches: 25,
      typingSpeed: 75.0,
      accuracy: 92.5,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLogin: DateTime.now(),
    );
  }

  Future<void> logout(String token) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock logout - nothing to do
  }

  Future<String> sendOtp(String phoneNumber) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock validation
    if (phoneNumber.isEmpty) {
      throw const ServerFailure('Phone number is required');
    }

    // Return mock session ID
    return 'session_${DateTime.now().millisecondsSinceEpoch}';
  }

  Future<UserModel> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    // Mock validation - accept any 4-6 digit OTP
    if (otp.length < 4 || otp.length > 6) {
      throw const ServerFailure('Invalid OTP');
    }

    // Return mock user
    return UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      username: 'User_${phoneNumber.substring(phoneNumber.length - 4)}',
      email: null,
      phone: phoneNumber,
      rank: 'BRONZE',
      level: 1,
      xp: 0,
      coins: 100,
      gems: 0,
      avatarUrl: null,
      wins: 0,
      losses: 0,
      totalMatches: 0,
      typingSpeed: 0.0,
      accuracy: 0.0,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    );
  }
}
