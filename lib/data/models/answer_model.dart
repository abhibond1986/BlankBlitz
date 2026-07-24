import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/answer_entity.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required String id,
    required String gameRoomId,
    required String wordId,
    required String userId,
    required String answer,
    required String status,
    required int roundNumber,
    @Default(0) int scoreEarned,
    required int timeTakenMs,
    @Default(0) int hintsUsed,
    @Default([]) List<String> powerUpsUsed,
    @Default(false) bool isFirstCorrect,
    int? rank,
    required DateTime submittedAt,
    @Default({}) Map<String, dynamic> metadata,
  }) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  factory AnswerModel.fromEntity(AnswerEntity entity) {
    return AnswerModel(
      id: entity.id,
      gameRoomId: entity.gameRoomId,
      wordId: entity.wordId,
      userId: entity.userId,
      answer: entity.answer,
      status: entity.status.name,
      roundNumber: entity.roundNumber,
      scoreEarned: entity.scoreEarned,
      timeTakenMs: entity.timeTaken.inMilliseconds,
      hintsUsed: entity.hintsUsed,
      powerUpsUsed: entity.powerUpsUsed,
      isFirstCorrect: entity.isFirstCorrect,
      rank: entity.rank,
      submittedAt: entity.submittedAt,
      metadata: entity.metadata,
    );
  }
}

extension AnswerModelX on AnswerModel {
  AnswerEntity toEntity() {
    return AnswerEntity(
      id: id,
      gameRoomId: gameRoomId,
      wordId: wordId,
      userId: userId,
      answer: answer,
      status: AnswerStatus.values.firstWhere((e) => e.name == status),
      roundNumber: roundNumber,
      scoreEarned: scoreEarned,
      timeTaken: Duration(milliseconds: timeTakenMs),
      hintsUsed: hintsUsed,
      powerUpsUsed: powerUpsUsed,
      isFirstCorrect: isFirstCorrect,
      rank: rank,
      submittedAt: submittedAt,
      metadata: metadata,
    );
  }
}

@freezed
class RoundResultModel with _$RoundResultModel {
  const factory RoundResultModel({
    required int roundNumber,
    required String wordId,
    required String correctWord,
    required List<AnswerModel> answers,
    required DateTime startTime,
    required DateTime endTime,
  }) = _RoundResultModel;

  factory RoundResultModel.fromJson(Map<String, dynamic> json) =>
      _$RoundResultModelFromJson(json);

  factory RoundResultModel.fromEntity(RoundResult entity) {
    return RoundResultModel(
      roundNumber: entity.roundNumber,
      wordId: entity.wordId,
      correctWord: entity.correctWord,
      answers: entity.answers.map((a) => AnswerModel.fromEntity(a)).toList(),
      startTime: entity.startTime,
      endTime: entity.endTime,
    );
  }
}

extension RoundResultModelX on RoundResultModel {
  RoundResult toEntity() {
    return RoundResult(
      roundNumber: roundNumber,
      wordId: wordId,
      correctWord: correctWord,
      answers: answers.map((a) => a.toEntity()).toList(),
      startTime: startTime,
      endTime: endTime,
    );
  }
}
