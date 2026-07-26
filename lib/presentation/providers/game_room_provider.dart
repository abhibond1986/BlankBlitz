import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/game_room_entity.dart';
import '../../domain/repositories/game_repository.dart';
import '../../data/repositories/game_repository_impl.dart';
import '../../core/error/failures.dart';

// Provider for GameRepository
final gameRepositoryProvider = Provider<GameRepository>((ref) {
  return GameRepositoryImpl();
});

// Game Room State
class GameRoomState {
  final GameRoomEntity? room;
  final bool isLoading;
  final String? error;
  final bool isCreating;
  final bool isJoining;

  GameRoomState({
    this.room,
    this.isLoading = false,
    this.error,
    this.isCreating = false,
    this.isJoining = false,
  });

  GameRoomState copyWith({
    GameRoomEntity? room,
    bool? isLoading,
    String? error,
    bool? isCreating,
    bool? isJoining,
  }) {
    return GameRoomState(
      room: room ?? this.room,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isCreating: isCreating ?? this.isCreating,
      isJoining: isJoining ?? this.isJoining,
    );
  }
}

// Game Room Notifier
class GameRoomNotifier extends StateNotifier<GameRoomState> {
  final GameRepository _gameRepository;

  GameRoomNotifier(this._gameRepository) : super(GameRoomState());

  Future<void> createRoom({
    required GameMode gameMode,
    required String hostId,
    RoomVisibility visibility = RoomVisibility.public,
    int maxPlayers = 10,
    int totalRounds = 10,
    int roundTimeLimit = 30,
    List<String> categories = const [],
    String difficulty = 'MEDIUM',
  }) async {
    state = state.copyWith(isCreating: true, error: null);

    final result = await _gameRepository.createRoom(
      gameMode: gameMode,
      hostId: hostId,
      visibility: visibility,
      maxPlayers: maxPlayers,
      totalRounds: totalRounds,
      roundTimeLimit: roundTimeLimit,
      categories: categories,
      difficulty: difficulty,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isCreating: false,
        error: failure.message,
      ),
      (room) => state = state.copyWith(
        room: room,
        isCreating: false,
        error: null,
      ),
    );
  }

  Future<void> joinRoom({
    required String roomCode,
    required String userId,
  }) async {
    state = state.copyWith(isJoining: true, error: null);

    final result = await _gameRepository.joinRoom(
      roomCode: roomCode,
      userId: userId,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isJoining: false,
        error: failure.message,
      ),
      (room) => state = state.copyWith(
        room: room,
        isJoining: false,
        error: null,
      ),
    );
  }

  Future<void> leaveRoom({
    required String roomId,
    required String userId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _gameRepository.leaveRoom(
      roomId: roomId,
      userId: userId,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (_) => state = GameRoomState(),
    );
  }

  Future<void> updatePlayerReady({
    required String roomId,
    required String userId,
    required bool isReady,
  }) async {
    final result = await _gameRepository.updatePlayerReady(
      roomId: roomId,
      userId: userId,
      isReady: isReady,
    );

    result.fold(
      (failure) => state = state.copyWith(error: failure.message),
      (_) => _refreshRoom(roomId),
    );
  }

  Future<void> startGame(String roomId) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _gameRepository.startGame(roomId);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (room) => state = state.copyWith(
        room: room,
        isLoading: false,
        error: null,
      ),
    );
  }

  Future<Either<Failure, GameRoomEntity>> quickMatch({
    String? userId,
    GameMode gameMode = GameMode.quickMatch,
    String difficulty = 'MEDIUM',
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    // Use provided userId or get from state
    final finalUserId = userId ?? state.room?.hostId ?? 'temp_user';

    final result = await _gameRepository.quickMatch(
      userId: finalUserId,
      gameMode: gameMode,
      difficulty: difficulty,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (room) {
        state = state.copyWith(
          room: room,
          isLoading: false,
          error: null,
        );
      },
    );

    return result;
  }

  Future<void> _refreshRoom(String roomId) async {
    final result = await _gameRepository.getRoom(roomId);
    result.fold(
      (failure) => state = state.copyWith(error: failure.message),
      (room) => state = state.copyWith(room: room),
    );
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearRoom() {
    state = GameRoomState();
  }
}

// Provider
final gameRoomProvider = StateNotifierProvider<GameRoomNotifier, GameRoomState>((ref) {
  return GameRoomNotifier(ref.watch(gameRepositoryProvider));
});

// Stream provider for real-time room updates
final roomStreamProvider = StreamProvider.family<GameRoomEntity, String>((ref, roomId) {
  final repository = ref.watch(gameRepositoryProvider);
  return repository.watchRoom(roomId);
});

// Provider for available rooms list
final availableRoomsProvider = FutureProvider.family<List<GameRoomEntity>, Map<String, dynamic>>((ref, params) async {
  final repository = ref.watch(gameRepositoryProvider);
  
  final result = await repository.getAvailableRooms(
    gameMode: params['gameMode'] as GameMode?,
    difficulty: params['difficulty'] as String?,
  );

  return result.fold(
    (failure) => throw Exception(failure.message),
    (rooms) => rooms,
  );
});
