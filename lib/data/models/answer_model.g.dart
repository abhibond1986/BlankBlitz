// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      id: json['id'] as String,
      gameRoomId: json['gameRoomId'] as String,
      wordId: json['wordId'] as String,
      userId: json['userId'] as String,
      answer: json['answer'] as String,
      status: json['status'] as String,
      roundNumber: (json['roundNumber'] as num).toInt(),
      scoreEarned: (json['scoreEarned'] as num?)?.toInt() ?? 0,
      timeTakenMs: (json['timeTakenMs'] as num).toInt(),
      hintsUsed: (json['hintsUsed'] as num?)?.toInt() ?? 0,
      powerUpsUsed: (json['powerUpsUsed'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFirstCorrect: json['isFirstCorrect'] as bool? ?? false,
      rank: (json['rank'] as num?)?.toInt(),
      submittedAt: DateTime.parse(json['submittedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gameRoomId': instance.gameRoomId,
      'wordId': instance.wordId,
      'userId': instance.userId,
      'answer': instance.answer,
      'status': instance.status,
      'roundNumber': instance.roundNumber,
      'scoreEarned': instance.scoreEarned,
      'timeTakenMs': instance.timeTakenMs,
      'hintsUsed': instance.hintsUsed,
      'powerUpsUsed': instance.powerUpsUsed,
      'isFirstCorrect': instance.isFirstCorrect,
      'rank': instance.rank,
      'submittedAt': instance.submittedAt.toIso8601String(),
      'metadata': instance.metadata,
    };

_$RoundResultModelImpl _$$RoundResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RoundResultModelImpl(
      roundNumber: (json['roundNumber'] as num).toInt(),
      wordId: json['wordId'] as String,
      correctWord: json['correctWord'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$RoundResultModelImplToJson(
        _$RoundResultModelImpl instance) =>
    <String, dynamic>{
      'roundNumber': instance.roundNumber,
      'wordId': instance.wordId,
      'correctWord': instance.correctWord,
      'answers': instance.answers,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
    };
