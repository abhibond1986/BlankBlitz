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
      xpToNextLevel: 5000,
      coins: 1250,
      gems: 50,
      avatar: null,
      avatarUrl: null,
      totalGamesPlayed: 42,
      totalWins: 28,
      totalLosses: 14,
      winRate: 66.67,
      highestScore: 9850,
      currentStreak: 5,
      longestStreak: 12,
      achievements: const [
        'FIRST_WIN',
        'WIN_STREAK_5',
        'SCORE_5000',
        'GAMES_PLAYED_25',
      ],
      badges: const ['FAST_FINGERS', 'WORD_MASTER'],
      friends: const [],
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      lastLoginAt: DateTime.now(),
      isOnline: true,
      isPremium: false,
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
      xpToNextLevel: 100,
      coins: 100, // Starting coins
      gems: 0,
      avatar: null,
      avatarUrl: null,
      totalGamesPlayed: 0,
      totalWins: 0,
      totalLosses: 0,
      winRate: 0.0,
      highestScore: 0,
      currentStreak: 0,
      longestStreak: 0,
      achievements: const [],
      badges: const [],
      friends: const [],
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
      isOnline: true,
      isPremium: false,
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
      xpToNextLevel: 3000,
      coins: 500,
      gems: 25,
      avatar: null,
      avatarUrl: null,
      totalGamesPlayed: 25,
      totalWins: 15,
      totalLosses: 10,
      winRate: 60.0,
      highestScore: 7500,
      currentStreak: 3,
      longestStreak: 8,
      achievements: const ['FIRST_WIN', 'GAMES_PLAYED_10'],
      badges: const ['NEWBIE'],
      friends: const [],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLoginAt: DateTime.now(),
      isOnline: true,
      isPremium: false,
    );
  }

  Future<void> logout(String token) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock logout - nothing to do
  }
}
