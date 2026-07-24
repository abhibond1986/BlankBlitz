import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/answer_entity.dart';
import '../../domain/entities/word_entity.dart';
import 'word_provider.dart';
import 'game_room_provider.dart';

// Gameplay State
class GameplayState {
  final int currentRound;
  final int timeRemaining;
  final int playerScore;
  final int correctAnswers;
  final int wrongAnswers;
  final bool isPlaying;
  final bool isPaused;
  final String? lastAnswer;
  final bool? lastAnswerCorrect;
  final List<AnswerEntity> answerHistory;

  GameplayState({
    this.currentRound = 1,
    this.timeRemaining = 30,
    this.playerScore = 0,
    this.correctAnswers = 0,
    this.wrongAnswers = 0,
    this.isPlaying = false,
    this.isPaused = false,
    this.lastAnswer,
    this.lastAnswerCorrect,
    this.answerHistory = const [],
  });

  GameplayState copyWith({
    int? currentRound,
    int? timeRemaining,
    int? playerScore,
    int? correctAnswers,
    int? wrongAnswers,
    bool? isPlaying,
    bool? isPaused,
    String? lastAnswer,
    bool? lastAnswerCorrect,
    List<AnswerEntity>? answerHistory,
  }) {
    return GameplayState(
      currentRound: currentRound ?? this.currentRound,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      playerScore: playerScore ?? this.playerScore,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      isPlaying: isPlaying ?? this.isPlaying,
      isPaused: isPaused ?? this.isPaused,
      lastAnswer: lastAnswer ?? this.lastAnswer,
      lastAnswerCorrect: lastAnswerCorrect ?? this.lastAnswerCorrect,
      answerHistory: answerHistory ?? this.answerHistory,
    );
  }
}

// Gameplay Notifier
class GameplayNotifier extends StateNotifier<GameplayState> {
  final Ref _ref;
  Timer? _timer;
  int _roundTimeLimit = 30;

  GameplayNotifier(this._ref) : super(GameplayState());

  void startGame({int roundTimeLimit = 30, int totalRounds = 10}) {
    _roundTimeLimit = roundTimeLimit;
    state = GameplayState(
      isPlaying: true,
      timeRemaining: roundTimeLimit,
    );
    _startTimer();

    // Get first word
    _ref.read(wordProvider.notifier).getRandomWord();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeRemaining > 0 && !state.isPaused) {
        state = state.copyWith(timeRemaining: state.timeRemaining - 1);
      } else if (state.timeRemaining == 0) {
        // Time's up - go to next round
        _handleTimeUp();
      }
    });
  }

  void _handleTimeUp() {
    // Mark as wrong answer (time expired)
    state = state.copyWith(
      wrongAnswers: state.wrongAnswers + 1,
      lastAnswerCorrect: false,
    );

    // Move to next round after delay
    Future.delayed(const Duration(seconds: 2), () {
      nextRound();
    });
  }

  Future<void> submitAnswer(String answer) async {
    if (!state.isPlaying || state.isPaused) return;

    final wordNotifier = _ref.read(wordProvider.notifier);
    final currentWord = _ref.read(wordProvider).currentWord;

    if (currentWord == null) return;

    // Validate answer
    final isCorrect = wordNotifier.validateAnswer(answer);

    if (isCorrect) {
      // Calculate score (base score + time bonus)
      final timeBonus = (state.timeRemaining * 10).toInt();
      final wordScore = currentWord.calculateScore(
        timeTaken: _roundTimeLimit - state.timeRemaining,
        hintsUsed: 0, // Track hints if implemented
      );
      final totalScore = wordScore + timeBonus;

      // Create answer entity
      final answerEntity = AnswerEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'local_user', // Replace with actual user ID
        wordId: currentWord.id,
        roomId: 'practice', // Replace with actual room ID
        roundNumber: state.currentRound,
        userAnswer: answer,
        isCorrect: true,
        timeTaken: _roundTimeLimit - state.timeRemaining,
        score: totalScore,
        submittedAt: DateTime.now(),
        status: AnswerStatus.correct,
      );

      state = state.copyWith(
        playerScore: state.playerScore + totalScore,
        correctAnswers: state.correctAnswers + 1,
        lastAnswer: answer,
        lastAnswerCorrect: true,
        answerHistory: [...state.answerHistory, answerEntity],
      );

      // Move to next round after showing feedback
      Future.delayed(const Duration(seconds: 1), () {
        nextRound();
      });
    } else {
      // Wrong answer
      final answerEntity = AnswerEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'local_user',
        wordId: currentWord.id,
        roomId: 'practice',
        roundNumber: state.currentRound,
        userAnswer: answer,
        isCorrect: false,
        timeTaken: _roundTimeLimit - state.timeRemaining,
        score: 0,
        submittedAt: DateTime.now(),
        status: AnswerStatus.wrong,
      );

      state = state.copyWith(
        wrongAnswers: state.wrongAnswers + 1,
        lastAnswer: answer,
        lastAnswerCorrect: false,
        answerHistory: [...state.answerHistory, answerEntity],
      );
    }
  }

  void nextRound() {
    if (!state.isPlaying) return;

    // Check if game should end
    final roomState = _ref.read(gameRoomProvider);
    final totalRounds = roomState.room?.totalRounds ?? 10;

    if (state.currentRound >= totalRounds) {
      endGame();
      return;
    }

    // Move to next round
    state = state.copyWith(
      currentRound: state.currentRound + 1,
      timeRemaining: _roundTimeLimit,
      lastAnswer: null,
      lastAnswerCorrect: null,
    );

    // Get next word
    _ref.read(wordProvider.notifier).getRandomWord();
  }

  void pauseGame() {
    if (!state.isPlaying) return;
    state = state.copyWith(isPaused: true);
  }

  void resumeGame() {
    if (!state.isPlaying) return;
    state = state.copyWith(isPaused: false);
  }

  void endGame() {
    _timer?.cancel();
    state = state.copyWith(
      isPlaying: false,
      isPaused: false,
    );
  }

  void resetGame() {
    _timer?.cancel();
    state = GameplayState();
    _ref.read(wordProvider.notifier).clearWord();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// Provider
final gameplayProvider = StateNotifierProvider<GameplayNotifier, GameplayState>((ref) {
  return GameplayNotifier(ref);
});

// Helper provider to get game progress
final gameProgressProvider = Provider<double>((ref) {
  final gameplay = ref.watch(gameplayProvider);
  final room = ref.watch(gameRoomProvider).room;

  if (room == null) return 0.0;

  return gameplay.currentRound / room.totalRounds;
});

// Helper provider to get accuracy
final gameAccuracyProvider = Provider<double>((ref) {
  final gameplay = ref.watch(gameplayProvider);
  final totalAttempts = gameplay.correctAnswers + gameplay.wrongAnswers;

  if (totalAttempts == 0) return 0.0;

  return (gameplay.correctAnswers / totalAttempts) * 100;
});
