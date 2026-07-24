import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';

enum LeaderboardType {
  global,
  country,
  friends,
  weekly,
  monthly,
  allTime,
}

class LeaderboardEntry {
  final String userId;
  final String username;
  final String? avatarUrl;
  final int rank;
  final int score;
  final int wins;
  final int level;
  final String rankTier;
  final Map<String, dynamic> stats;

  const LeaderboardEntry({
    required this.userId,
    required this.username,
    this.avatarUrl,
    required this.rank,
    required this.score,
    required this.wins,
    required this.level,
    required this.rankTier,
    this.stats = const {},
  });
}

abstract class LeaderboardRepository {
  // Get Leaderboards
  Future<Either<Failure, List<LeaderboardEntry>>> getLeaderboard({
    required LeaderboardType type,
    int limit = 100,
    int offset = 0,
  });

  Future<Either<Failure, LeaderboardEntry?>> getUserRank({
    required String userId,
    required LeaderboardType type,
  });

  Future<Either<Failure, List<LeaderboardEntry>>> getFriendsLeaderboard({
    required String userId,
    int limit = 50,
  });

  // Category-specific leaderboards
  Future<Either<Failure, List<LeaderboardEntry>>> getCategoryLeaderboard({
    required String category,
    required LeaderboardType type,
    int limit = 100,
  });

  // Real-time updates
  Stream<List<LeaderboardEntry>> watchLeaderboard({
    required LeaderboardType type,
    int limit = 100,
  });

  // Player comparison
  Future<Either<Failure, Map<String, dynamic>>> compareWithPlayer({
    required String userId,
    required String targetUserId,
  });
}
