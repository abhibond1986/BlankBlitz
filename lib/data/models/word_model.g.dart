// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HintDataModelImpl _$$HintDataModelImplFromJson(Map<String, dynamic> json) =>
    _$HintDataModelImpl(
      type: json['type'] as String,
      content: json['content'] as String,
      cost: (json['cost'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$HintDataModelImplToJson(_$HintDataModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.content,
      'cost': instance.cost,
    };

_$WordModelImpl _$$WordModelImplFromJson(Map<String, dynamic> json) =>
    _$WordModelImpl(
      id: json['id'] as String,
      word: json['word'] as String,
      displayPattern: json['displayPattern'] as String,
      blankedIndices: (json['blankedIndices'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      difficulty: json['difficulty'] as String,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      definition: json['definition'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      relatedWords: (json['relatedWords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hints: (json['hints'] as List<dynamic>?)
              ?.map((e) => HintDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      baseScore: (json['baseScore'] as num?)?.toInt() ?? 100,
      timeBonus: (json['timeBonus'] as num?)?.toInt() ?? 50,
      language: json['language'] as String? ?? 'en',
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WordModelImplToJson(_$WordModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'displayPattern': instance.displayPattern,
      'blankedIndices': instance.blankedIndices,
      'difficulty': instance.difficulty,
      'categories': instance.categories,
      'definition': instance.definition,
      'synonyms': instance.synonyms,
      'relatedWords': instance.relatedWords,
      'hints': instance.hints,
      'baseScore': instance.baseScore,
      'timeBonus': instance.timeBonus,
      'language': instance.language,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
