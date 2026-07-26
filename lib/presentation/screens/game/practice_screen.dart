import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/game_room_entity.dart';
import '../../providers/gameplay_provider.dart';
import '../../providers/word_provider.dart';
import '../../providers/game_room_provider.dart';
import '../../providers/auth_provider.dart';

class PracticeScreen extends ConsumerStatefulWidget {
  const PracticeScreen({super.key});

  @override
  ConsumerState<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends ConsumerState<PracticeScreen> {
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _answerFocus = FocusNode();
  bool _gameStarted = false;

  @override
  void initState() {
    super.initState();
    // Initialize practice room
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startPractice();
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    _answerFocus.dispose();
    super.dispose();
  }

  void _startPractice() async {
    final user = ref.read(authProvider).user;
    if (user == null) return;

    // Create a practice room
    await ref.read(gameRoomProvider.notifier).createRoom(
      gameMode: GameMode.soloPractice,
      hostId: user.id,
      visibility: RoomVisibility.private,
      maxPlayers: 1,
      totalRounds: 10,
      roundTimeLimit: 30,
    );

    // Start gameplay
    ref.read(gameplayProvider.notifier).startGame(
      roundTimeLimit: 30,
      totalRounds: 10,
    );

    setState(() {
      _gameStarted = true;
    });

    // Auto-focus answer field
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _answerFocus.requestFocus();
      }
    });
  }

  void _submitAnswer() {
    final answer = _answerController.text.trim().toUpperCase();
    if (answer.isEmpty) return;

    ref.read(gameplayProvider.notifier).submitAnswer(answer);
    _answerController.clear();
  }

  void _endGame() {
    ref.read(gameplayProvider.notifier).endGame();

    // Navigate to results
    final gameplayState = ref.read(gameplayProvider);
    context.push('/results', extra: {
      'score': gameplayState.playerScore,
      'correct': gameplayState.correctAnswers,
      'wrong': gameplayState.wrongAnswers,
      'totalRounds': gameplayState.currentRound,
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameplayState = ref.watch(gameplayProvider);
    final wordState = ref.watch(wordProvider);
    final currentWord = wordState.currentWord;

    // Check if game ended
    if (gameplayState.isPlaying == false && _gameStarted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _endGame();
      });
    }

    if (!_gameStarted || currentWord == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              const Text('Loading game...'),
            ],
          ),
        ),
      );
    }

    final displayWord = _maskWord(currentWord.word);
    final timeProgress = gameplayState.timeRemaining / 30;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6366F1),
              Color(0xFF8B5CF6),
              Color(0xFFEC4899),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        _showQuitDialog();
                      },
                    ),
                    // Round counter
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Round ${gameplayState.currentRound}/10',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Score
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${gameplayState.playerScore}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Timer
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: timeProgress,
                      strokeWidth: 8,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        timeProgress > 0.5 ? AppColors.success : AppColors.error,
                      ),
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .scale(
                          duration: const Duration(milliseconds: 1000),
                          begin: const Offset(1.0, 1.0),
                          end: const Offset(1.05, 1.05),
                        ),
                    Text(
                      '${gameplayState.timeRemaining}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Category badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  currentWord.categories.isNotEmpty
                      ? currentWord.categories.first.name.toUpperCase()
                      : 'GENERAL',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Word display
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Text(
                  displayWord,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    letterSpacing: 8,
                  ),
                ),
              ).animate().fadeIn().scale(),

              const SizedBox(height: 40),

              // Answer input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _answerController,
                  focusNode: _answerFocus,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    hintText: 'Type your answer',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 18,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                  onSubmitted: (_) => _submitAnswer(),
                ),
              ),

              const SizedBox(height: 20),

              // Submit button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: _submitAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Stats
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(
                      icon: Icons.check_circle,
                      label: 'Correct',
                      value: '${gameplayState.correctAnswers}',
                      color: AppColors.success,
                    ),
                    _buildStatCard(
                      icon: Icons.cancel,
                      label: 'Wrong',
                      value: '${gameplayState.wrongAnswers}',
                      color: AppColors.error,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  String _maskWord(String word) {
    if (word.isEmpty) return '';

    // Show first and last letter, mask middle
    if (word.length <= 2) {
      return word;
    }

    final first = word[0];
    final last = word[word.length - 1];
    final middle = '_' * (word.length - 2);

    return '$first $middle $last';
  }

  void _showQuitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quit Game?'),
        content: const Text('Are you sure you want to quit? Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(gameplayProvider.notifier).resetGame();
              Navigator.of(context).pop();
              context.pop();
            },
            child: const Text('Quit', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}
