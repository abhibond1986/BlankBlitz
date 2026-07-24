import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/word_repository.dart';
import '../../data/repositories/word_repository_impl.dart';

// Provider for WordRepository
final wordRepositoryProvider = Provider<WordRepository>((ref) {
  return WordRepositoryImpl();
});

// Word State
class WordState {
  final WordEntity? currentWord;
  final bool isLoading;
  final String? error;
  final List<WordEntity> wordHistory;

  WordState({
    this.currentWord,
    this.isLoading = false,
    this.error,
    this.wordHistory = const [],
  });

  WordState copyWith({
    WordEntity? currentWord,
    bool? isLoading,
    String? error,
    List<WordEntity>? wordHistory,
  }) {
    return WordState(
      currentWord: currentWord ?? this.currentWord,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      wordHistory: wordHistory ?? this.wordHistory,
    );
  }
}

// Word Notifier
class WordNotifier extends StateNotifier<WordState> {
  final WordRepository _wordRepository;

  WordNotifier(this._wordRepository) : super(WordState());

  Future<void> getRandomWord({
    String? category,
    String? difficulty,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _wordRepository.getRandomWord(
      category: category,
      difficulty: difficulty,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (word) {
        final updatedHistory = [...state.wordHistory, word];
        state = state.copyWith(
          currentWord: word,
          isLoading: false,
          error: null,
          wordHistory: updatedHistory,
        );
      },
    );
  }

  Future<void> getNextWord(String roomId) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _wordRepository.getRandomWord();

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (word) {
        final updatedHistory = [...state.wordHistory, word];
        state = state.copyWith(
          currentWord: word,
          isLoading: false,
          error: null,
          wordHistory: updatedHistory,
        );
      },
    );
  }

  bool validateAnswer(String answer) {
    if (state.currentWord == null) return false;

    final result = _wordRepository.validateAnswer(
      wordId: state.currentWord!.id,
      userAnswer: answer,
    );

    // Return true/false synchronously for immediate UI feedback
    return result.fold(
      (failure) => false,
      (isValid) => isValid,
    );
  }

  Future<Map<String, dynamic>?> getHint(String hintType) async {
    if (state.currentWord == null) return null;

    final result = await _wordRepository.getHint(
      wordId: state.currentWord!.id,
      hintType: hintType,
    );

    return result.fold(
      (failure) => null,
      (hint) => hint,
    );
  }

  void clearWord() {
    state = WordState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Provider
final wordProvider = StateNotifierProvider<WordNotifier, WordState>((ref) {
  return WordNotifier(ref.watch(wordRepositoryProvider));
});

// Preload words for faster gameplay
final preloadWordsProvider = FutureProvider.family<void, Map<String, dynamic>>((ref, params) async {
  final repository = ref.watch(wordRepositoryProvider);

  await repository.preloadWords(
    count: params['count'] as int? ?? 50,
    category: params['category'] as String?,
    difficulty: params['difficulty'] as String?,
  );
});
