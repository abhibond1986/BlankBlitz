import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../domain/entities/game_room_entity.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/entities/answer_entity.dart';
import '../../domain/repositories/game_repository.dart';
import '../../core/errors/failures.dart';

class GameRepositoryImpl implements GameRepository {
  // Mock data storage
  final Map<String, GameRoomEntity> _rooms = {};
  final StreamController<GameRoomEntity> _roomController = StreamController.broadcast();
  int _roomCounter = 1000;

  @override
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
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate network

      final roomCode = _generateRoomCode();
      final roomId = 'room_${_roomCounter++}';

      final room = GameRoomEntity(
        id: roomId,
        roomCode: roomCode,
        hostId: hostId,
        gameMode: gameMode,
        status: GameStatus.waiting,
        visibility: visibility,
        players: [
          PlayerState(
            userId: hostId,
            username: 'Host Player',
            isHost: true,
            isReady: true,
            joinedAt: DateTime.now(),
          ),
        ],
        maxPlayers: maxPlayers,
        totalRounds: totalRounds,
        roundTimeLimit: roundTimeLimit,
        categories: categories,
        difficulty: difficulty,
        entryFee: entryFee,
        entryCurrency: entryCurrency,
        createdAt: DateTime.now(),
      );

      _rooms[roomId] = room;
      _roomController.add(room);

      return Right(room);
    } catch (e) {
      return Left(ServerFailure('Failed to create room: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, GameRoomEntity>> joinRoom({
    required String roomCode,
    required String userId,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final room = _rooms.values.firstWhere(
        (r) => r.roomCode == roomCode,
        orElse: () => throw Exception('Room not found'),
      );

      if (room.isFull) {
        return Left(ServerFailure('Room is full'));
      }

      final updatedPlayers = [
        ...room.players,
        PlayerState(
          userId: userId,
          username: 'Player ${room.players.length + 1}',
          joinedAt: DateTime.now(),
        ),
      ];

      final updatedRoom = GameRoomEntity(
        id: room.id,
        roomCode: room.roomCode,
        hostId: room.hostId,
        gameMode: room.gameMode,
        status: room.status,
        visibility: room.visibility,
        players: updatedPlayers,
        maxPlayers: room.maxPlayers,
        totalRounds: room.totalRounds,
        roundTimeLimit: room.roundTimeLimit,
        categories: room.categories,
        difficulty: room.difficulty,
        createdAt: room.createdAt,
      );

      _rooms[room.id] = updatedRoom;
      _roomController.add(updatedRoom);

      return Right(updatedRoom);
    } catch (e) {
      return Left(ServerFailure('Failed to join room: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, GameRoomEntity>> getRoom(String roomId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final room = _rooms[roomId];
      if (room == null) {
        return Left(ServerFailure('Room not found'));
      }

      return Right(room);
    } catch (e) {
      return Left(ServerFailure('Failed to get room: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<GameRoomEntity>>> getAvailableRooms({
    GameMode? gameMode,
    String? difficulty,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      var rooms = _rooms.values.where((r) => 
        r.status == GameStatus.waiting && 
        !r.isFull &&
        r.visibility == RoomVisibility.public
      ).toList();

      if (gameMode != null) {
        rooms = rooms.where((r) => r.gameMode == gameMode).toList();
      }

      if (difficulty != null) {
        rooms = rooms.where((r) => r.difficulty == difficulty).toList();
      }

      return Right(rooms);
    } catch (e) {
      return Left(ServerFailure('Failed to get rooms: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> leaveRoom({
    required String roomId,
    required String userId,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final room = _rooms[roomId];
      if (room == null) {
        return Left(ServerFailure('Room not found'));
      }

      final updatedPlayers = room.players.where((p) => p.userId != userId).toList();

      if (updatedPlayers.isEmpty) {
        _rooms.remove(roomId);
        return const Right(null);
      }

      final updatedRoom = GameRoomEntity(
        id: room.id,
        roomCode: room.roomCode,
        hostId: updatedPlayers.first.userId,
        gameMode: room.gameMode,
        status: room.status,
        visibility: room.visibility,
        players: updatedPlayers,
        maxPlayers: room.maxPlayers,
        totalRounds: room.totalRounds,
        roundTimeLimit: room.roundTimeLimit,
        categories: room.categories,
        difficulty: room.difficulty,
        createdAt: room.createdAt,
      );

      _rooms[roomId] = updatedRoom;
      _roomController.add(updatedRoom);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to leave room: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePlayerReady({
    required String roomId,
    required String userId,
    required bool isReady,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final room = _rooms[roomId];
      if (room == null) {
        return Left(ServerFailure('Room not found'));
      }

      final updatedPlayers = room.players.map((p) {
        if (p.userId == userId) {
          return PlayerState(
            userId: p.userId,
            username: p.username,
            avatarUrl: p.avatarUrl,
            score: p.score,
            correctAnswers: p.correctAnswers,
            wrongAnswers: p.wrongAnswers,
            isReady: isReady,
            isHost: p.isHost,
            isConnected: p.isConnected,
            currentRank: p.currentRank,
            joinedAt: p.joinedAt,
          );
        }
        return p;
      }).toList();

      final updatedRoom = GameRoomEntity(
        id: room.id,
        roomCode: room.roomCode,
        hostId: room.hostId,
        gameMode: room.gameMode,
        status: room.status,
        visibility: room.visibility,
        players: updatedPlayers,
        maxPlayers: room.maxPlayers,
        totalRounds: room.totalRounds,
        roundTimeLimit: room.roundTimeLimit,
        categories: room.categories,
        difficulty: room.difficulty,
        createdAt: room.createdAt,
      );

      _rooms[roomId] = updatedRoom;
      _roomController.add(updatedRoom);

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update ready status: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, GameRoomEntity>> startGame(String roomId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final room = _rooms[roomId];
      if (room == null) {
        return Left(ServerFailure('Room not found'));
      }

      if (!room.canStart) {
        return Left(ServerFailure('Not all players are ready'));
      }

      final updatedRoom = GameRoomEntity(
        id: room.id,
        roomCode: room.roomCode,
        hostId: room.hostId,
        gameMode: room.gameMode,
        status: GameStatus.inProgress,
        visibility: room.visibility,
        players: room.players,
        maxPlayers: room.maxPlayers,
        currentRound: 1,
        totalRounds: room.totalRounds,
        roundTimeLimit: room.roundTimeLimit,
        categories: room.categories,
        difficulty: room.difficulty,
        createdAt: room.createdAt,
        startedAt: DateTime.now(),
      );

      _rooms[roomId] = updatedRoom;
      _roomController.add(updatedRoom);

      return Right(updatedRoom);
    } catch (e) {
      return Left(ServerFailure('Failed to start game: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, WordEntity>> getNextWord({
    required String roomId,
    required int roundNumber,
    List<String> categories = const [],
    String difficulty = 'MEDIUM',
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      // Mock word generation
      final words = [
        'APPLE', 'ORANGE', 'BANANA', 'GRAPE', 'MANGO',
        'ELEPHANT', 'TIGER', 'LION', 'ZEBRA', 'GIRAFFE',
        'GUITAR', 'PIANO', 'DRUM', 'VIOLIN', 'FLUTE',
      ];

      final word = words[roundNumber % words.length];
      final blankedIndices = _generateBlankedIndices(word.length, difficulty);
      final displayPattern = _generateDisplayPattern(word, blankedIndices);

      final wordEntity = WordEntity(
        id: 'word_$roundNumber',
        word: word,
        displayPattern: displayPattern,
        blankedIndices: blankedIndices,
        difficulty: WordDifficulty.medium,
        categories: [WordCategory.general],
        baseScore: 100,
        timeBonus: 50,
        createdAt: DateTime.now(),
      );

      return Right(wordEntity);
    } catch (e) {
      return Left(ServerFailure('Failed to get word: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AnswerEntity>> submitAnswer({
    required String roomId,
    required String wordId,
    required String userId,
    required String answer,
    required int roundNumber,
    required Duration timeTaken,
    int hintsUsed = 0,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final answerEntity = AnswerEntity(
        id: 'answer_${DateTime.now().millisecondsSinceEpoch}',
        gameRoomId: roomId,
        wordId: wordId,
        userId: userId,
        answer: answer,
        status: AnswerStatus.correct, // Simplified for mock
        roundNumber: roundNumber,
        scoreEarned: 125,
        timeTaken: timeTaken,
        hintsUsed: hintsUsed,
        submittedAt: DateTime.now(),
      );

      return Right(answerEntity);
    } catch (e) {
      return Left(ServerFailure('Failed to submit answer: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, RoundResult>> getRoundResults({
    required String roomId,
    required int roundNumber,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      final result = RoundResult(
        roundNumber: roundNumber,
        wordId: 'word_$roundNumber',
        correctWord: 'APPLE',
        answers: [],
        startTime: DateTime.now().subtract(const Duration(seconds: 30)),
        endTime: DateTime.now(),
      );

      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to get results: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, GameRoomEntity>> nextRound(String roomId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final room = _rooms[roomId];
      if (room == null) {
        return Left(ServerFailure('Room not found'));
      }

      final updatedRoom = GameRoomEntity(
        id: room.id,
        roomCode: room.roomCode,
        hostId: room.hostId,
        gameMode: room.gameMode,
        status: room.status,
        visibility: room.visibility,
        players: room.players,
        maxPlayers: room.maxPlayers,
        currentRound: room.currentRound + 1,
        totalRounds: room.totalRounds,
        roundTimeLimit: room.roundTimeLimit,
        categories: room.categories,
        difficulty: room.difficulty,
        createdAt: room.createdAt,
        startedAt: room.startedAt,
      );

      _rooms[roomId] = updatedRoom;
      _roomController.add(updatedRoom);

      return Right(updatedRoom);
    } catch (e) {
      return Left(ServerFailure('Failed to advance round: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> finishGame(String roomId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final room = _rooms[roomId];
      if (room == null) {
        return Left(ServerFailure('Room not found'));
      }

      final updatedRoom = GameRoomEntity(
        id: room.id,
        roomCode: room.roomCode,
        hostId: room.hostId,
        gameMode: room.gameMode,
        status: GameStatus.finished,
        visibility: room.visibility,
        players: room.players,
        maxPlayers: room.maxPlayers,
        currentRound: room.currentRound,
        totalRounds: room.totalRounds,
        roundTimeLimit: room.roundTimeLimit,
        categories: room.categories,
        difficulty: room.difficulty,
        createdAt: room.createdAt,
        startedAt: room.startedAt,
        finishedAt: DateTime.now(),
      );

      _rooms[roomId] = updatedRoom;

      return Right({
        'gameId': roomId,
        'winner': room.players.first.userId,
        'totalPlayers': room.players.length,
        'duration': DateTime.now().difference(room.startedAt!).inSeconds,
      });
    } catch (e) {
      return Left(ServerFailure('Failed to finish game: ${e.toString()}'));
    }
  }

  @override
  Stream<GameRoomEntity> watchRoom(String roomId) {
    return _roomController.stream.where((room) => room.id == roomId);
  }

  @override
  Stream<List<PlayerState>> watchPlayers(String roomId) {
    return _roomController.stream
        .where((room) => room.id == roomId)
        .map((room) => room.players);
  }

  @override
  Stream<WordEntity?> watchCurrentWord(String roomId) {
    return Stream.value(null); // Simplified for mock
  }

  @override
  Future<Either<Failure, GameRoomEntity>> quickMatch({
    required String userId,
    GameMode gameMode = GameMode.quickMatch,
    String difficulty = 'MEDIUM',
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate matchmaking

      // Try to find existing room
      final availableRooms = await getAvailableRooms(
        gameMode: gameMode,
        difficulty: difficulty,
      );

      return availableRooms.fold(
        (failure) => Left(failure),
        (rooms) async {
          if (rooms.isNotEmpty) {
            return joinRoom(roomCode: rooms.first.roomCode, userId: userId);
          } else {
            return createRoom(
              gameMode: gameMode,
              hostId: userId,
              difficulty: difficulty,
            );
          }
        },
      );
    } catch (e) {
      return Left(ServerFailure('Matchmaking failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cancelMatchmaking(String userId) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getGameStats(String gameRoomId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      return Right({
        'totalRounds': 10,
        'completedRounds': 5,
        'averageScore': 850,
        'highestScore': 1200,
      });
    } catch (e) {
      return Left(ServerFailure('Failed to get stats: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getPlayerGameStats({
    required String userId,
    required String gameRoomId,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      return Right({
        'score': 850,
        'correctAnswers': 7,
        'wrongAnswers': 3,
        'averageTime': 18.5,
        'rank': 2,
      });
    } catch (e) {
      return Left(ServerFailure('Failed to get player stats: ${e.toString()}'));
    }
  }

  // Helper methods
  String _generateRoomCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(6, (i) => chars[(DateTime.now().millisecond + i) % chars.length]).join();
  }

  List<int> _generateBlankedIndices(int wordLength, String difficulty) {
    final blankCount = difficulty == 'EASY' ? 2 : difficulty == 'HARD' ? 4 : 3;
    final indices = <int>[];
    for (int i = 1; i < wordLength && indices.length < blankCount; i += 2) {
      indices.add(i);
    }
    return indices;
  }

  String _generateDisplayPattern(String word, List<int> blankedIndices) {
    final chars = word.split('');
    for (final index in blankedIndices) {
      if (index < chars.length) {
        chars[index] = '_';
      }
    }
    return chars.join(' ');
  }

  void dispose() {
    _roomController.close();
  }
}
