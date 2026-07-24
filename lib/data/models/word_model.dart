import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/word_entity.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
class HintDataModel with _$HintDataModel {
  const factory HintDataModel({
    required String type,
    required String content,
    @Default(10) int cost,
  }) = _HintDataModel;

  factory HintDataModel.fromJson(Map<String, dynamic> json) =>
      _$HintDataModelFromJson(json);

  factory HintDataModel.fromEntity(HintData entity) {
    return HintDataModel(
      type: entity.type,
      content: entity.content,
      cost: entity.cost,
    );
  }
}

extension HintDataModelX on HintDataModel {
  HintData toEntity() {
    return HintData(
      type: type,
      content: content,
      cost: cost,
    );
  }
}

@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    required String id,
    required String word,
    required String displayPattern,
    required List<int> blankedIndices,
    required String difficulty,
    @Default([]) List<String> categories,
    String? definition,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> relatedWords,
    @Default([]) List<HintDataModel> hints,
    @Default(100) int baseScore,
    @Default(50) int timeBonus,
    @Default('en') String language,
    @Default({}) Map<String, dynamic> metadata,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);

  factory WordModel.fromEntity(WordEntity entity) {
    return WordModel(
      id: entity.id,
      word: entity.word,
      displayPattern: entity.displayPattern,
      blankedIndices: entity.blankedIndices,
      difficulty: entity.difficulty.name,
      categories: entity.categories.map((c) => c.name).toList(),
      definition: entity.definition,
      synonyms: entity.synonyms,
      relatedWords: entity.relatedWords,
      hints: entity.hints.map((h) => HintDataModel.fromEntity(h)).toList(),
      baseScore: entity.baseScore,
      timeBonus: entity.timeBonus,
      language: entity.language,
      metadata: entity.metadata,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

extension WordModelX on WordModel {
  WordEntity toEntity() {
    return WordEntity(
      id: id,
      word: word,
      displayPattern: displayPattern,
      blankedIndices: blankedIndices,
      difficulty: WordDifficulty.values.firstWhere((e) => e.name == difficulty),
      categories: categories
          .map((c) => WordCategory.values.firstWhere((e) => e.name == c))
          .toList(),
      definition: definition,
      synonyms: synonyms,
      relatedWords: relatedWords,
      hints: hints.map((h) => h.toEntity()).toList(),
      baseScore: baseScore,
      timeBonus: timeBonus,
      language: language,
      metadata: metadata,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
