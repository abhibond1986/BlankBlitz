import 'package:equatable/equatable.dart';

/// User domain entity
class UserEntity extends Equatable {
  final String id;
  final String username;
  final String? email;
  final String? phone;
  final String? avatarUrl;
  final String rank;
  final int level;
  final int xp;
  final int coins;
  final int gems;
  final int wins;
  final int losses;
  final int totalMatches;
  final double typingSpeed;
  final double accuracy;
  final bool isAdmin;
  final bool isBanned;
  final DateTime? lastLogin;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.username,
    this.email,
    this.phone,
    this.avatarUrl,
    this.rank = 'BRONZE',
    this.level = 1,
    this.xp = 0,
    this.coins = 0,
    this.gems = 0,
    this.wins = 0,
    this.losses = 0,
    this.totalMatches = 0,
    this.typingSpeed = 0.0,
    this.accuracy = 0.0,
    this.isAdmin = false,
    this.isBanned = false,
    this.lastLogin,
    required this.createdAt,
  });

  double get winRate => totalMatches > 0 ? (wins / totalMatches * 100) : 0.0;

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        phone,
        avatarUrl,
        rank,
        level,
        xp,
        coins,
        gems,
        wins,
        losses,
        totalMatches,
        typingSpeed,
        accuracy,
        isAdmin,
        isBanned,
        lastLogin,
        createdAt,
      ];
}
