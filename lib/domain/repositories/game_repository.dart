import 'package:dartz/dartz.dart';
import '../entities/game_room_entity.dart';
import '../entities/word_entity.dart';
import '../entities/answer_entity.dart';
import '../../core/errors/failures.dart';

abstract class GameRepository {
  // Room Management
  Future<Either<Failure, GameRoomEntity>> createRoom({
    required GameMode gameMode,
    required String hostId,
    RoomVisibility visibility = RoomVisibility.public,
    int maxPlayers = 10,
    int totalRounds = 10,
    int roundTimeLimit = 30,
    List<String> categories = const [],
    String difficulty = 'MEDIUM',
    int entryFee = 0,
    String entryCurrency = 'coins',
  });

  Future<Either<Failure, GameRoomEntity>> joinRoom({
    required String roomCode,
    required String userId,
  });

  Future<Either<Failure, GameRoomEntity>> getRoom(String roomId);

  Future<Either<Failure, List<GameRoomEntity>>> getAvailableRooms({
    GameMode? gameMode,
    String? difficulty,
  });

  Future<Either<Failure, void>> leaveRoom({
    required String roomId,
    required String userId,
  });

  Future<Either<Failure, void>> updatePlayerReady({
    required String roomId,
    required String userId,
    required bool isReady,
  });

  // Game Flow
  Future<Either<Failure, GameRoomEntity>> startGame(String roomId);

  Future<Either<Failure, WordEntity>> getNextWord({
    required String roomId,
    required int roundNumber,
    List<String> categories = const [],
    String difficulty = 'MEDIUM',
  });

  Future<Either<Failure, AnswerEntity>> submitAnswer({
    required String roomId,
    required String wordId,
    required String userId,
    required String answer,
    required int roundNumber,
    required Duration timeTaken,
    int hintsUsed = 0,
  });

  Future<Either<Failure, RoundResult>> getRoundResults({
    required String roomId,
    required int roundNumber,
  });

  Future<Either<Failure, GameRoomEntity>> nextRound(String roomId);

  Future<Either<Failure, Map<String, dynamic>>> finishGame(String roomId);

  // Real-time Updates
  Stream<GameRoomEntity> watchRoom(String roomId);
  
  Stream<List<PlayerState>> watchPlayers(String roomId);
  
  Stream<WordEntity?> watchCurrentWord(String roomId);

  // Matchmaking
  Future<Either<Failure, GameRoomEntity>> quickMatch({
    required String userId,
    GameMode gameMode = GameMode.quickMatch,
    String difficulty = 'MEDIUM',
  });

  Future<Either<Failure, void>> cancelMatchmaking(String userId);

  // Statistics
  Future<Either<Failure, Map<String, dynamic>>> getGameStats(String gameRoomId);
  
  Future<Either<Failure, Map<String, dynamic>>> getPlayerGameStats({
    required String userId,
    required String gameRoomId,
  });
}
