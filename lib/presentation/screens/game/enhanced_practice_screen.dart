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
import '../../widgets/app_logo.dart';
import '../../widgets/celebration_overlay.dart';
import '../../widgets/player_stats_overlay.dart';

class EnhancedPracticeScreen extends ConsumerStatefulWidget {
  const EnhancedPracticeScreen({super.key});

  @override
  ConsumerState<EnhancedPracticeScreen> createState() => _EnhancedPracticeScreenState();
}

class _EnhancedPracticeScreenState extends ConsumerState<EnhancedPracticeScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _answerFocus = FocusNode();
  bool _gameStarted = false;
  late AnimationController _pulseController;
  bool _showCelebration = false;
  bool _lastAnswerCorrect = false;
  int _lastPoints = 0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startPractice();
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    _answerFocus.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _startPractice() async {
    final user = ref.read(authProvider).user;
    if (user == null) return;

    await ref.read(gameRoomProvider.notifier).createRoom(
      gameMode: GameMode.soloPractice,
      hostId: user.id,
      visibility: RoomVisibility.private,
      maxPlayers: 1,
      totalRounds: 10,
      roundTimeLimit: 30,
    );

    ref.read(gameplayProvider.notifier).startGame(
      roundTimeLimit: 30,
      totalRounds: 10,
    );

    setState(() {
      _gameStarted = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _answerFocus.requestFocus();
      }
    });
  }

  void _submitAnswer() {
    final answer = _answerController.text.trim().toUpperCase();
    if (answer.isEmpty) return;

    final wordState = ref.read(wordProvider);
    final currentWord = wordState.currentWord;
    if (currentWord == null) return;

    final isCorrect = answer == currentWord.word.toUpperCase();
    final points = isCorrect ? 150 : 0; // Base points for correct answer

    // Show celebration
    setState(() {
      _showCelebration = true;
      _lastAnswerCorrect = isCorrect;
      _lastPoints = points;
    });

    // Submit answer to provider
    ref.read(gameplayProvider.notifier).submitAnswer(answer);
    _answerController.clear();

    // Hide celebration after delay
    Future.delayed(Duration(milliseconds: isCorrect ? 1500 : 800), () {
      if (mounted) {
        setState(() {
          _showCelebration = false;
        });
      }
    });
  }

  void _endGame() {
    ref.read(gameplayProvider.notifier).endGame();

    final gameplayState = ref.read(gameplayProvider);
    context.push('/results', extra: {
      'score': gameplayState.playerScore,
      'correct': gameplayState.correctAnswers,
      'wrong': gameplayState.wrongAnswers,
      'totalRounds': gameplayState.currentRound,
    });
  }

  Color _getTimerColor(int timeRemaining) {
    if (timeRemaining > 20) return const Color(0xFF10B981); // Green
    if (timeRemaining > 10) return const Color(0xFFFBBF24); // Yellow
    return const Color(0xFFEF4444); // Red
  }

  @override
  Widget build(BuildContext context) {
    final gameplayState = ref.watch(gameplayProvider);
    final wordState = ref.watch(wordProvider);
    final currentWord = wordState.currentWord;

    if (gameplayState.isPlaying == false && _gameStarted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _endGame();
      });
    }

    if (!_gameStarted || currentWord == null) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1E1B4B), // Dark purple
                const Color(0xFF312E81), // Purple
                const Color(0xFF6366F1), // Blue
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bolt,
                    size: 40,
                    color: Color(0xFFFBBF24),
                  ),
                ).animate(onPlay: (controller) => controller.repeat())
                  .scale(duration: 800.ms, begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1)),
                const SizedBox(height: 24),
                const Text(
                  'Loading game...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final displayWord = _maskWord(currentWord.word);
    final timerColor = _getTimerColor(gameplayState.timeRemaining);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1E1B4B), // Dark purple
              const Color(0xFF312E81), // Medium purple
              const Color(0xFF6366F1), // Bright blue
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // Header with logo and stats
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo
                        const AppLogo(size: 40),

                        // Round indicator
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white.withOpacity(0.3)),
                          ),
                          child: Text(
                            'Round ${gameplayState.currentRound}/10',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),

                        // Score
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFBBF24),
                                const Color(0xFFF59E0B),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFBBF24).withOpacity(0.5),
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.white, size: 20),
                              const SizedBox(width: 6),
                              Text(
                                '${gameplayState.playerScore}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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

              // Timer - Large and prominent
              Stack(
                alignment: Alignment.center,
                children: [
                  // Outer glow
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: timerColor.withOpacity(0.4),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  // Timer circle
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: gameplayState.timeRemaining / 30,
                          strokeWidth: 12,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(timerColor),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${gameplayState.timeRemaining}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 56,
                                fontWeight: FontWeight.bold,
                                height: 1,
                                shadows: [
                                  Shadow(
                                    color: timerColor.withOpacity(0.5),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              'seconds',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ).animate(
                key: ValueKey(gameplayState.timeRemaining),
              ).scale(
                duration: 150.ms,
                begin: const Offset(0.95, 0.95),
                end: const Offset(1.0, 1.0),
              ),

              const SizedBox(height: 40),

              // Category badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF8B5CF6),
                      const Color(0xFFEC4899),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEC4899).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  currentWord.categories.isNotEmpty
                      ? currentWord.categories.first.name.toUpperCase()
                      : 'GENERAL',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Word display
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Text(
                  displayWord,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1E1B4B),
                    letterSpacing: 12,
                    height: 1.2,
                  ),
                ),
              ).animate().fadeIn(duration: 300.ms).scale(
                duration: 400.ms,
                begin: const Offset(0.8, 0.8),
              ),

              const Spacer(),

              // Answer input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: _answerController,
                  focusNode: _answerFocus,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 8,
                  ),
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    hintText: 'TYPE YOUR ANSWER',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFFBBF24), width: 3),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  ),
                  onSubmitted: (_) => _submitAnswer(),
                ),
              ),

              const SizedBox(height: 16),

              // Submit button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: _submitAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFBBF24),
                    foregroundColor: const Color(0xFF1E1B4B),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    minimumSize: const Size(double.infinity, 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                    shadowColor: const Color(0xFFFBBF24).withOpacity(0.5),
                  ),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Stats row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(
                      icon: Icons.check_circle,
                      label: 'Correct',
                      value: '${gameplayState.correctAnswers}',
                      color: const Color(0xFF10B981),
                    ),
                    _buildStatCard(
                      icon: Icons.cancel,
                      label: 'Wrong',
                      value: '${gameplayState.wrongAnswers}',
                      color: const Color(0xFFEF4444),
                    ),
                  ],
                ),
              ),

                  const SizedBox(height: 24),
                ],
              ),

              // Celebration overlay
              if (_showCelebration)
                Positioned.fill(
                  child: CelebrationOverlay(
                    show: _showCelebration,
                    isCorrect: _lastAnswerCorrect,
                    points: _lastPoints,
                    onComplete: () {
                      setState(() {
                        _showCelebration = false;
                      });
                    },
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5), width: 2),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _maskWord(String word) {
    if (word.isEmpty) return '';
    if (word.length <= 2) return word;

    final first = word[0];
    final last = word[word.length - 1];
    final middle = '_ ' * (word.length - 2);

    return '$first  $middle$last';
  }

  void _showQuitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1B4B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Quit Game?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Are you sure you want to quit? Your progress will be lost.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(gameplayProvider.notifier).resetGame();
              Navigator.of(context).pop();
              context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
            ),
            child: const Text('Quit'),
          ),
        ],
      ),
    );
  }
}
