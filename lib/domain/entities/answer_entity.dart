import 'package:equatable/equatable.dart';

enum AnswerStatus {
  pending,
  correct,
  incorrect,
  timeout,
  skipped,
}

class AnswerEntity extends Equatable {
  final String id;
  final String gameRoomId;
  final String wordId;
  final String userId;
  final String answer;
  final AnswerStatus status;
  final int roundNumber;
  final int scoreEarned;
  final Duration timeTaken;
  final int hintsUsed;
  final List<String> powerUpsUsed;
  final bool isFirstCorrect; // First person to answer correctly
  final int? rank; // Ranking in this round (1st, 2nd, 3rd, etc.)
  final DateTime submittedAt;
  final Map<String, dynamic> metadata;

  const AnswerEntity({
    required this.id,
    required this.gameRoomId,
    required this.wordId,
    required this.userId,
    required this.answer,
    required this.status,
    required this.roundNumber,
    this.scoreEarned = 0,
    required this.timeTaken,
    this.hintsUsed = 0,
    this.powerUpsUsed = const [],
    this.isFirstCorrect = false,
    this.rank,
    required this.submittedAt,
    this.metadata = const {},
  });

  // Computed properties
  bool get isCorrect => status == AnswerStatus.correct;
  
  bool get isIncorrect => status == AnswerStatus.incorrect;
  
  bool get isTimeout => status == AnswerStatus.timeout;
  
  bool get isSkipped => status == AnswerStatus.skipped;
  
  bool get usedHints => hintsUsed > 0;
  
  bool get usedPowerUps => powerUpsUsed.isNotEmpty;
  
  double get timeInSeconds => timeTaken.inMilliseconds / 1000.0;

  @override
  List<Object?> get props => [
        id,
        gameRoomId,
        wordId,
        userId,
        answer,
        status,
        roundNumber,
        scoreEarned,
        timeTaken,
        hintsUsed,
        powerUpsUsed,
        isFirstCorrect,
        rank,
        submittedAt,
        metadata,
      ];
}

// Round result aggregation
class RoundResult extends Equatable {
  final int roundNumber;
  final String wordId;
  final String correctWord;
  final List<AnswerEntity> answers;
  final DateTime startTime;
  final DateTime endTime;

  const RoundResult({
    required this.roundNumber,
    required this.wordId,
    required this.correctWord,
    required this.answers,
    required this.startTime,
    required this.endTime,
  });

  // Computed properties
  Duration get roundDuration => endTime.difference(startTime);
  
  int get totalAnswers => answers.length;
  
  int get correctAnswers => answers.where((a) => a.isCorrect).length;
  
  int get incorrectAnswers => answers.where((a) => a.isIncorrect).length;
  
  double get accuracyRate => totalAnswers > 0 ? (correctAnswers / totalAnswers) * 100 : 0;
  
  AnswerEntity? get fastestCorrect {
    final correct = answers.where((a) => a.isCorrect).toList();
    if (correct.isEmpty) return null;
    correct.sort((a, b) => a.timeTaken.compareTo(b.timeTaken));
    return correct.first;
  }

  @override
  List<Object?> get props => [
        roundNumber,
        wordId,
        correctWord,
        answers,
        startTime,
        endTime,
      ];
}
