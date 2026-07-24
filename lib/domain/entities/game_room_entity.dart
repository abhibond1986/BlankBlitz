import 'package:equatable/equatable.dart';

enum GameMode {
  soloPractice,
  quickMatch,
  privateRoom,
  publicRoom,
  battleRoyale,
  classroom,
  tournament,
}

enum GameStatus {
  waiting,
  starting,
  inProgress,
  paused,
  finished,
  cancelled,
}

enum RoomVisibility {
  public,
  private,
  friendsOnly,
}

class PlayerState extends Equatable {
  final String userId;
  final String username;
  final String? avatarUrl;
  final int score;
  final int correctAnswers;
  final int wrongAnswers;
  final bool isReady;
  final bool isHost;
  final bool isConnected;
  final int? currentRank;
  final DateTime joinedAt;

  const PlayerState({
    required this.userId,
    required this.username,
    this.avatarUrl,
    this.score = 0,
    this.correctAnswers = 0,
    this.wrongAnswers = 0,
    this.isReady = false,
    this.isHost = false,
    this.isConnected = true,
    this.currentRank,
    required this.joinedAt,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        avatarUrl,
        score,
        correctAnswers,
        wrongAnswers,
        isReady,
        isHost,
        isConnected,
        currentRank,
        joinedAt,
      ];
}

class GameRoomEntity extends Equatable {
  final String id;
  final String roomCode;
  final String hostId;
  final GameMode gameMode;
  final GameStatus status;
  final RoomVisibility visibility;
  final List<PlayerState> players;
  final int maxPlayers;
  final int currentRound;
  final int totalRounds;
  final int roundTimeLimit;
  final String? currentWordId;
  final DateTime? roundStartTime;
  final DateTime? roundEndTime;
  final List<String> categories;
  final String difficulty;
  final bool allowHints;
  final int hintsPerRound;
  final bool allowPowerUps;
  final int entryFee;
  final String entryCurrency; // 'coins' or 'gems'
  final Map<String, dynamic> prizes;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final Map<String, dynamic> settings;

  const GameRoomEntity({
    required this.id,
    required this.roomCode,
    required this.hostId,
    required this.gameMode,
    required this.status,
    required this.visibility,
    required this.players,
    this.maxPlayers = 10,
    this.currentRound = 0,
    this.totalRounds = 10,
    this.roundTimeLimit = 30,
    this.currentWordId,
    this.roundStartTime,
    this.roundEndTime,
    this.categories = const [],
    this.difficulty = 'MEDIUM',
    this.allowHints = true,
    this.hintsPerRound = 3,
    this.allowPowerUps = false,
    this.entryFee = 0,
    this.entryCurrency = 'coins',
    this.prizes = const {},
    required this.createdAt,
    this.startedAt,
    this.finishedAt,
    this.settings = const {},
  });

  // Computed properties
  int get playerCount => players.length;
  
  bool get isFull => players.length >= maxPlayers;
  
  bool get canStart => players.length >= 2 && players.every((p) => p.isReady || p.isHost);
  
  PlayerState? get host => players.firstWhere(
        (p) => p.userId == hostId,
        orElse: () => players.first,
      );
  
  bool get isInProgress => status == GameStatus.inProgress;
  
  bool get isWaiting => status == GameStatus.waiting;
  
  bool get isFinished => status == GameStatus.finished;
  
  Duration? get roundTimeRemaining {
    if (roundStartTime == null) return null;
    final elapsed = DateTime.now().difference(roundStartTime!);
    final remaining = Duration(seconds: roundTimeLimit) - elapsed;
    return remaining.isNegative ? Duration.zero : remaining;
  }

  @override
  List<Object?> get props => [
        id,
        roomCode,
        hostId,
        gameMode,
        status,
        visibility,
        players,
        maxPlayers,
        currentRound,
        totalRounds,
        roundTimeLimit,
        currentWordId,
        roundStartTime,
        roundEndTime,
        categories,
        difficulty,
        allowHints,
        hintsPerRound,
        allowPowerUps,
        entryFee,
        entryCurrency,
        prizes,
        createdAt,
        startedAt,
        finishedAt,
        settings,
      ];
}
