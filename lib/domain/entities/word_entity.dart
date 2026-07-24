import 'package:equatable/equatable.dart';

enum WordDifficulty {
  easy,
  medium,
  hard,
  expert,
}

enum WordCategory {
  animals,
  food,
  sports,
  technology,
  nature,
  movies,
  music,
  science,
  geography,
  history,
  general,
}

class HintData extends Equatable {
  final String type; // 'letter', 'definition', 'synonym', 'category'
  final String content;
  final int cost; // Coins/gems cost

  const HintData({
    required this.type,
    required this.content,
    this.cost = 10,
  });

  @override
  List<Object?> get props => [type, content, cost];
}

class WordEntity extends Equatable {
  final String id;
  final String word;
  final String displayPattern; // e.g., "A _ _ L E" for "APPLE"
  final List<int> blankedIndices; // e.g., [1, 2, 3] for positions hidden
  final WordDifficulty difficulty;
  final List<WordCategory> categories;
  final String? definition;
  final List<String> synonyms;
  final List<String> relatedWords;
  final List<HintData> hints;
  final int baseScore;
  final int timeBonus;
  final String language;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const WordEntity({
    required this.id,
    required this.word,
    required this.displayPattern,
    required this.blankedIndices,
    required this.difficulty,
    this.categories = const [],
    this.definition,
    this.synonyms = const [],
    this.relatedWords = const [],
    this.hints = const [],
    this.baseScore = 100,
    this.timeBonus = 50,
    this.language = 'en',
    this.metadata = const {},
    required this.createdAt,
    this.updatedAt,
  });

  // Computed properties
  int get wordLength => word.length;
  
  int get blankedCount => blankedIndices.length;
  
  double get blankPercentage => (blankedCount / wordLength) * 100;
  
  int get maxScore => baseScore + timeBonus;
  
  bool get hasDefinition => definition != null && definition!.isNotEmpty;
  
  bool get hasSynonyms => synonyms.isNotEmpty;
  
  bool get hasHints => hints.isNotEmpty;

  // Calculate score based on time taken
  int calculateScore(Duration timeTaken, int roundTimeLimit) {
    if (timeTaken.inSeconds >= roundTimeLimit) return baseScore;
    
    final remainingTime = roundTimeLimit - timeTaken.inSeconds;
    final timeBonusMultiplier = remainingTime / roundTimeLimit;
    final calculatedBonus = (timeBonus * timeBonusMultiplier).round();
    
    return baseScore + calculatedBonus;
  }

  // Validate answer (case-insensitive)
  bool isCorrectAnswer(String answer) {
    return answer.trim().toUpperCase() == word.toUpperCase();
  }

  @override
  List<Object?> get props => [
        id,
        word,
        displayPattern,
        blankedIndices,
        difficulty,
        categories,
        definition,
        synonyms,
        relatedWords,
        hints,
        baseScore,
        timeBonus,
        language,
        metadata,
        createdAt,
        updatedAt,
      ];
}
