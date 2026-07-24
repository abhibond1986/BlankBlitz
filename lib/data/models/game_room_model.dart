import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/game_room_entity.dart';

part 'game_room_model.freezed.dart';
part 'game_room_model.g.dart';

@freezed
class PlayerStateModel with _$PlayerStateModel {
  const factory PlayerStateModel({
    required String userId,
    required String username,
    String? avatarUrl,
    @Default(0) int score,
    @Default(0) int correctAnswers,
    @Default(0) int wrongAnswers,
    @Default(false) bool isReady,
    @Default(false) bool isHost,
    @Default(true) bool isConnected,
    int? currentRank,
    required DateTime joinedAt,
  }) = _PlayerStateModel;

  factory PlayerStateModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateModelFromJson(json);

  factory PlayerStateModel.fromEntity(PlayerState entity) {
    return PlayerStateModel(
      userId: entity.userId,
      username: entity.username,
      avatarUrl: entity.avatarUrl,
      score: entity.score,
      correctAnswers: entity.correctAnswers,
      wrongAnswers: entity.wrongAnswers,
      isReady: entity.isReady,
      isHost: entity.isHost,
      isConnected: entity.isConnected,
      currentRank: entity.currentRank,
      joinedAt: entity.joinedAt,
    );
  }
}

extension PlayerStateModelX on PlayerStateModel {
  PlayerState toEntity() {
    return PlayerState(
      userId: userId,
      username: username,
      avatarUrl: avatarUrl,
      score: score,
      correctAnswers: correctAnswers,
      wrongAnswers: wrongAnswers,
      isReady: isReady,
      isHost: isHost,
      isConnected: isConnected,
      currentRank: currentRank,
      joinedAt: joinedAt,
    );
  }
}

@freezed
class GameRoomModel with _$GameRoomModel {
  const factory GameRoomModel({
    required String id,
    required String roomCode,
    required String hostId,
    required String gameMode,
    required String status,
    required String visibility,
    required List<PlayerStateModel> players,
    @Default(10) int maxPlayers,
    @Default(0) int currentRound,
    @Default(10) int totalRounds,
    @Default(30) int roundTimeLimit,
    String? currentWordId,
    DateTime? roundStartTime,
    DateTime? roundEndTime,
    @Default([]) List<String> categories,
    @Default('MEDIUM') String difficulty,
    @Default(true) bool allowHints,
    @Default(3) int hintsPerRound,
    @Default(false) bool allowPowerUps,
    @Default(0) int entryFee,
    @Default('coins') String entryCurrency,
    @Default({}) Map<String, dynamic> prizes,
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    @Default({}) Map<String, dynamic> settings,
  }) = _GameRoomModel;

  factory GameRoomModel.fromJson(Map<String, dynamic> json) =>
      _$GameRoomModelFromJson(json);

  factory GameRoomModel.fromEntity(GameRoomEntity entity) {
    return GameRoomModel(
      id: entity.id,
      roomCode: entity.roomCode,
      hostId: entity.hostId,
      gameMode: entity.gameMode.name,
      status: entity.status.name,
      visibility: entity.visibility.name,
      players: entity.players
          .map((p) => PlayerStateModel.fromEntity(p))
          .toList(),
      maxPlayers: entity.maxPlayers,
      currentRound: entity.currentRound,
      totalRounds: entity.totalRounds,
      roundTimeLimit: entity.roundTimeLimit,
      currentWordId: entity.currentWordId,
      roundStartTime: entity.roundStartTime,
      roundEndTime: entity.roundEndTime,
      categories: entity.categories,
      difficulty: entity.difficulty,
      allowHints: entity.allowHints,
      hintsPerRound: entity.hintsPerRound,
      allowPowerUps: entity.allowPowerUps,
      entryFee: entity.entryFee,
      entryCurrency: entity.entryCurrency,
      prizes: entity.prizes,
      createdAt: entity.createdAt,
      startedAt: entity.startedAt,
      finishedAt: entity.finishedAt,
      settings: entity.settings,
    );
  }
}

extension GameRoomModelX on GameRoomModel {
  GameRoomEntity toEntity() {
    return GameRoomEntity(
      id: id,
      roomCode: roomCode,
      hostId: hostId,
      gameMode: GameMode.values.firstWhere((e) => e.name == gameMode),
      status: GameStatus.values.firstWhere((e) => e.name == status),
      visibility: RoomVisibility.values.firstWhere((e) => e.name == visibility),
      players: players.map((p) => p.toEntity()).toList(),
      maxPlayers: maxPlayers,
      currentRound: currentRound,
      totalRounds: totalRounds,
      roundTimeLimit: roundTimeLimit,
      currentWordId: currentWordId,
      roundStartTime: roundStartTime,
      roundEndTime: roundEndTime,
      categories: categories,
      difficulty: difficulty,
      allowHints: allowHints,
      hintsPerRound: hintsPerRound,
      allowPowerUps: allowPowerUps,
      entryFee: entryFee,
      entryCurrency: entryCurrency,
      prizes: prizes,
      createdAt: createdAt,
      startedAt: startedAt,
      finishedAt: finishedAt,
      settings: settings,
    );
  }
}
