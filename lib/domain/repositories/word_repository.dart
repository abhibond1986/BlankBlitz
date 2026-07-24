import 'package:dartz/dartz.dart';
import '../entities/word_entity.dart';
import '../../core/errors/failures.dart';

abstract class WordRepository {
  // Word Retrieval
  Future<Either<Failure, WordEntity>> getWord(String wordId);
  
  Future<Either<Failure, WordEntity>> getRandomWord({
    String difficulty = 'MEDIUM',
    List<WordCategory> categories = const [],
    String language = 'en',
  });

  Future<Either<Failure, List<WordEntity>>> getWords({
    int limit = 50,
    String? difficulty,
    List<WordCategory>? categories,
    String language = 'en',
  });

  // Word Pack Management
  Future<Either<Failure, List<WordEntity>>> getWordPack({
    required int count,
    required String difficulty,
    required List<String> categories,
    List<String> excludeIds = const [],
  });

  // Validation
  Future<Either<Failure, bool>> validateAnswer({
    required String wordId,
    required String answer,
  });

  // Hints
  Future<Either<Failure, HintData>> getHint({
    required String wordId,
    required String hintType,
  });

  // Search
  Future<Either<Failure, List<WordEntity>>> searchWords({
    required String query,
    int limit = 20,
  });

  // Statistics
  Future<Either<Failure, Map<String, dynamic>>> getWordStats(String wordId);
  
  Future<Either<Failure, Map<String, dynamic>>> getCategoryStats();

  // Caching
  Future<Either<Failure, void>> preloadWords({
    int count = 100,
    String difficulty = 'MEDIUM',
    List<String> categories = const [],
  });

  Future<Either<Failure, void>> clearCache();
}
