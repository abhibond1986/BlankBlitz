// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStateModelImpl _$$PlayerStateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlayerStateModelImpl(
      userId: json['userId'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      score: (json['score'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      wrongAnswers: (json['wrongAnswers'] as num?)?.toInt() ?? 0,
      isReady: json['isReady'] as bool? ?? false,
      isHost: json['isHost'] as bool? ?? false,
      isConnected: json['isConnected'] as bool? ?? true,
      currentRank: (json['currentRank'] as num?)?.toInt(),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );

Map<String, dynamic> _$$PlayerStateModelImplToJson(
        _$PlayerStateModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'score': instance.score,
      'correctAnswers': instance.correctAnswers,
      'wrongAnswers': instance.wrongAnswers,
      'isReady': instance.isReady,
      'isHost': instance.isHost,
      'isConnected': instance.isConnected,
      'currentRank': instance.currentRank,
      'joinedAt': instance.joinedAt.toIso8601String(),
    };

_$GameRoomModelImpl _$$GameRoomModelImplFromJson(Map<String, dynamic> json) =>
    _$GameRoomModelImpl(
      id: json['id'] as String,
      roomCode: json['roomCode'] as String,
      hostId: json['hostId'] as String,
      gameMode: json['gameMode'] as String,
      status: json['status'] as String,
      visibility: json['visibility'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerStateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxPlayers: (json['maxPlayers'] as num?)?.toInt() ?? 10,
      currentRound: (json['currentRound'] as num?)?.toInt() ?? 0,
      totalRounds: (json['totalRounds'] as num?)?.toInt() ?? 10,
      roundTimeLimit: (json['roundTimeLimit'] as num?)?.toInt() ?? 30,
      currentWordId: json['currentWordId'] as String?,
      roundStartTime: json['roundStartTime'] == null
          ? null
          : DateTime.parse(json['roundStartTime'] as String),
      roundEndTime: json['roundEndTime'] == null
          ? null
          : DateTime.parse(json['roundEndTime'] as String),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      difficulty: json['difficulty'] as String? ?? 'MEDIUM',
      allowHints: json['allowHints'] as bool? ?? true,
      hintsPerRound: (json['hintsPerRound'] as num?)?.toInt() ?? 3,
      allowPowerUps: json['allowPowerUps'] as bool? ?? false,
      entryFee: (json['entryFee'] as num?)?.toInt() ?? 0,
      entryCurrency: json['entryCurrency'] as String? ?? 'coins',
      prizes: json['prizes'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      settings: json['settings'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$GameRoomModelImplToJson(_$GameRoomModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomCode': instance.roomCode,
      'hostId': instance.hostId,
      'gameMode': instance.gameMode,
      'status': instance.status,
      'visibility': instance.visibility,
      'players': instance.players,
      'maxPlayers': instance.maxPlayers,
      'currentRound': instance.currentRound,
      'totalRounds': instance.totalRounds,
      'roundTimeLimit': instance.roundTimeLimit,
      'currentWordId': instance.currentWordId,
      'roundStartTime': instance.roundStartTime?.toIso8601String(),
      'roundEndTime': instance.roundEndTime?.toIso8601String(),
      'categories': instance.categories,
      'difficulty': instance.difficulty,
      'allowHints': instance.allowHints,
      'hintsPerRound': instance.hintsPerRound,
      'allowPowerUps': instance.allowPowerUps,
      'entryFee': instance.entryFee,
      'entryCurrency': instance.entryCurrency,
      'prizes': instance.prizes,
      'createdAt': instance.createdAt.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'settings': instance.settings,
    };
