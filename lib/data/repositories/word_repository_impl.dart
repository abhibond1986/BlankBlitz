import 'package:dartz/dartz.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/word_repository.dart';
import '../../core/errors/failures.dart';
import 'dart:math';

class WordRepositoryImpl implements WordRepository {
  final Random _random = Random();
  
  // Mock word database
  final List<Map<String, dynamic>> _wordDatabase = [
    {'word': 'APPLE', 'category': 'food', 'difficulty': 'easy'},
    {'word': 'ORANGE', 'category': 'food', 'difficulty': 'easy'},
    {'word': 'BANANA', 'category': 'food', 'difficulty': 'easy'},
    {'word': 'ELEPHANT', 'category': 'animals', 'difficulty': 'medium'},
    {'word': 'TIGER', 'category': 'animals', 'difficulty': 'easy'},
    {'word': 'GIRAFFE', 'category': 'animals', 'difficulty': 'medium'},
    {'word': 'GUITAR', 'category': 'music', 'difficulty': 'easy'},
    {'word': 'PIANO', 'category': 'music', 'difficulty': 'easy'},
    {'word': 'COMPUTER', 'category': 'technology', 'difficulty': 'medium'},
    {'word': 'SMARTPHONE', 'category': 'technology', 'difficulty': 'hard'},
    {'word': 'MOUNTAIN', 'category': 'nature', 'difficulty': 'medium'},
    {'word': 'OCEAN', 'category': 'nature', 'difficulty': 'easy'},
    {'word': 'BASKETBALL', 'category': 'sports', 'difficulty': 'medium'},
    {'word': 'FOOTBALL', 'category': 'sports', 'difficulty': 'easy'},
    {'word': 'TELESCOPE', 'category': 'science', 'difficulty': 'hard'},
  ];

  @override
  Future<Either<Failure, WordEntity>> getWord(String wordId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final wordData = _wordDatabase[_random.nextInt(_wordDatabase.length)];
      final word = _createWordEntity(wordData, wordId);

      return Right(word);
    } catch (e) {
      return Left(ServerFailure('Failed to get word: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, WordEntity>> getRandomWord({
    String difficulty = 'MEDIUM',
    List<WordCategory> categories = const [],
    String language = 'en',
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      var filteredWords = _wordDatabase;

      if (difficulty != 'MEDIUM') {
        filteredWords = filteredWords.where((w) => 
          w['difficulty'].toString().toUpperCase() == difficulty.toUpperCase()
        ).toList();
      }

      if (categories.isNotEmpty) {
        final categoryNames = categories.map((c) => c.name).toList();
        filteredWords = filteredWords.where((w) =>
          categoryNames.contains(w['category'])
        ).toList();
      }

      if (filteredWords.isEmpty) {
        filteredWords = _wordDatabase;
      }

      final wordData = filteredWords[_random.nextInt(filteredWords.length)];
      final word = _createWordEntity(
        wordData,
        'word_${DateTime.now().millisecondsSinceEpoch}',
      );

      return Right(word);
    } catch (e) {
      return Left(ServerFailure('Failed to get random word: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WordEntity>>> getWords({
    int limit = 50,
    String? difficulty,
    List<WordCategory>? categories,
    String language = 'en',
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      var filteredWords = _wordDatabase;

      if (difficulty != null) {
        filteredWords = filteredWords.where((w) =>
          w['difficulty'].toString().toUpperCase() == difficulty.toUpperCase()
        ).toList();
      }

      if (categories != null && categories.isNotEmpty) {
        final categoryNames = categories.map((c) => c.name).toList();
        filteredWords = filteredWords.where((w) =>
          categoryNames.contains(w['category'])
        ).toList();
      }

      final words = filteredWords.take(limit).map((wordData) =>
        _createWordEntity(
          wordData,
          'word_${_random.nextInt(10000)}',
        )
      ).toList();

      return Right(words);
    } catch (e) {
      return Left(ServerFailure('Failed to get words: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WordEntity>>> getWordPack({
    required int count,
    required String difficulty,
    required List<String> categories,
    List<String> excludeIds = const [],
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      var filteredWords = _wordDatabase.where((w) =>
        w['difficulty'].toString().toUpperCase() == difficulty.toUpperCase() &&
        (categories.isEmpty || categories.contains(w['category']))
      ).toList();

      filteredWords.shuffle(_random);

      final words = filteredWords.take(count).map((wordData) =>
        _createWordEntity(
          wordData,
          'word_${_random.nextInt(100000)}',
        )
      ).toList();

      return Right(words);
    } catch (e) {
      return Left(ServerFailure('Failed to get word pack: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> validateAnswer({
    required String wordId,
    required String answer,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));

      // Mock validation - in real app, would check against stored word
      return Right(answer.isNotEmpty);
    } catch (e) {
      return Left(ServerFailure('Failed to validate answer: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, HintData>> getHint({
    required String wordId,
    required String hintType,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      HintData hint;

      switch (hintType) {
        case 'letter':
          hint = const HintData(
            type: 'letter',
            content: 'The second letter is P',
            cost: 10,
          );
          break;
        case 'definition':
          hint = const HintData(
            type: 'definition',
            content: 'A round fruit that grows on trees',
            cost: 15,
          );
          break;
        case 'synonym':
          hint = const HintData(
            type: 'synonym',
            content: 'Similar to: fruit',
            cost: 20,
          );
          break;
        case 'category':
          hint = const HintData(
            type: 'category',
            content: 'Category: Food',
            cost: 5,
          );
          break;
        default:
          hint = const HintData(
            type: 'letter',
            content: 'First letter revealed',
            cost: 10,
          );
      }

      return Right(hint);
    } catch (e) {
      return Left(ServerFailure('Failed to get hint: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WordEntity>>> searchWords({
    required String query,
    int limit = 20,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final filteredWords = _wordDatabase.where((w) =>
        w['word'].toString().toLowerCase().contains(query.toLowerCase())
      ).toList();

      final words = filteredWords.take(limit).map((wordData) =>
        _createWordEntity(
          wordData,
          'word_search_${_random.nextInt(10000)}',
        )
      ).toList();

      return Right(words);
    } catch (e) {
      return Left(ServerFailure('Failed to search words: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getWordStats(String wordId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      return Right({
        'timesPlayed': _random.nextInt(1000),
        'averageScore': 100 + _random.nextInt(50),
        'averageTime': 15 + _random.nextInt(15).toDouble(),
        'successRate': 60 + _random.nextInt(30).toDouble(),
      });
    } catch (e) {
      return Left(ServerFailure('Failed to get word stats: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCategoryStats() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      return Right({
        'food': 25,
        'animals': 30,
        'music': 15,
        'technology': 20,
        'nature': 18,
        'sports': 22,
        'science': 12,
      });
    } catch (e) {
      return Left(ServerFailure('Failed to get category stats: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> preloadWords({
    int count = 100,
    String difficulty = 'MEDIUM',
    List<String> categories = const [],
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      // Simulate preloading
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to preload words: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to clear cache: ${e.toString()}'));
    }
  }

  // Helper method to create WordEntity from mock data
  WordEntity _createWordEntity(Map<String, dynamic> data, String id) {
    final word = data['word'] as String;
    final difficulty = _parseDifficulty(data['difficulty'] as String);
    final category = _parseCategory(data['category'] as String);

    final blankedIndices = _generateBlankedIndices(word.length, difficulty);
    final displayPattern = _generateDisplayPattern(word, blankedIndices);

    return WordEntity(
      id: id,
      word: word,
      displayPattern: displayPattern,
      blankedIndices: blankedIndices,
      difficulty: difficulty,
      categories: [category],
      definition: _generateDefinition(word, category),
      synonyms: [],
      relatedWords: [],
      hints: _generateHints(word),
      baseScore: _calculateBaseScore(difficulty),
      timeBonus: 50,
      createdAt: DateTime.now(),
    );
  }

  WordDifficulty _parseDifficulty(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return WordDifficulty.easy;
      case 'hard':
        return WordDifficulty.hard;
      case 'expert':
        return WordDifficulty.expert;
      default:
        return WordDifficulty.medium;
    }
  }

  WordCategory _parseCategory(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return WordCategory.food;
      case 'animals':
        return WordCategory.animals;
      case 'music':
        return WordCategory.music;
      case 'technology':
        return WordCategory.technology;
      case 'nature':
        return WordCategory.nature;
      case 'sports':
        return WordCategory.sports;
      case 'science':
        return WordCategory.science;
      default:
        return WordCategory.general;
    }
  }

  List<int> _generateBlankedIndices(int wordLength, WordDifficulty difficulty) {
    final blankCount = difficulty == WordDifficulty.easy ? 2 :
                       difficulty == WordDifficulty.hard ? 4 :
                       difficulty == WordDifficulty.expert ? 5 : 3;
    
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

  String _generateDefinition(String word, WordCategory category) {
    return 'A ${category.name} related word';
  }

  List<HintData> _generateHints(String word) {
    return [
      HintData(
        type: 'letter',
        content: 'First letter is ${word[0]}',
        cost: 10,
      ),
      const HintData(
        type: 'definition',
        content: 'Think about the category',
        cost: 15,
      ),
    ];
  }

  int _calculateBaseScore(WordDifficulty difficulty) {
    switch (difficulty) {
      case WordDifficulty.easy:
        return 80;
      case WordDifficulty.medium:
        return 100;
      case WordDifficulty.hard:
        return 150;
      case WordDifficulty.expert:
        return 200;
    }
  }
}
