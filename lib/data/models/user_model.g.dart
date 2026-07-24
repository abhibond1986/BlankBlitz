// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      rank: json['rank'] as String? ?? 'BRONZE',
      level: (json['level'] as num?)?.toInt() ?? 1,
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      coins: (json['coins'] as num?)?.toInt() ?? 0,
      gems: (json['gems'] as num?)?.toInt() ?? 0,
      wins: (json['wins'] as num?)?.toInt() ?? 0,
      losses: (json['losses'] as num?)?.toInt() ?? 0,
      totalMatches: (json['total_matches'] as num?)?.toInt() ?? 0,
      typingSpeed: (json['typing_speed'] as num?)?.toDouble() ?? 0.0,
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      isAdmin: json['is_admin'] as bool? ?? false,
      isBanned: json['is_banned'] as bool? ?? false,
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'avatar_url': instance.avatarUrl,
      'rank': instance.rank,
      'level': instance.level,
      'xp': instance.xp,
      'coins': instance.coins,
      'gems': instance.gems,
      'wins': instance.wins,
      'losses': instance.losses,
      'total_matches': instance.totalMatches,
      'typing_speed': instance.typingSpeed,
      'accuracy': instance.accuracy,
      'is_admin': instance.isAdmin,
      'is_banned': instance.isBanned,
      'last_login': instance.lastLogin?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
