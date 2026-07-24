import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String username,
    String? email,
    String? phone,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @Default('BRONZE') String rank,
    @Default(1) int level,
    @Default(0) int xp,
    @Default(0) int coins,
    @Default(0) int gems,
    @Default(0) int wins,
    @Default(0) int losses,
    @JsonKey(name: 'total_matches') @Default(0) int totalMatches,
    @JsonKey(name: 'typing_speed') @Default(0.0) double typingSpeed,
    @Default(0.0) double accuracy,
    @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
    @JsonKey(name: 'last_login') DateTime? lastLogin,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convert to domain entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      email: email,
      phone: phone,
      avatarUrl: avatarUrl,
      rank: rank,
      level: level,
      xp: xp,
      coins: coins,
      gems: gems,
      wins: wins,
      losses: losses,
      totalMatches: totalMatches,
      typingSpeed: typingSpeed,
      accuracy: accuracy,
      isAdmin: isAdmin,
      isBanned: isBanned,
      lastLogin: lastLogin,
      createdAt: createdAt,
    );
  }

  /// Create from domain entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      phone: entity.phone,
      avatarUrl: entity.avatarUrl,
      rank: entity.rank,
      level: entity.level,
      xp: entity.xp,
      coins: entity.coins,
      gems: entity.gems,
      wins: entity.wins,
      losses: entity.losses,
      totalMatches: entity.totalMatches,
      typingSpeed: entity.typingSpeed,
      accuracy: entity.accuracy,
      isAdmin: entity.isAdmin,
      isBanned: entity.isBanned,
      lastLogin: entity.lastLogin,
      createdAt: entity.createdAt,
    );
  }
}
