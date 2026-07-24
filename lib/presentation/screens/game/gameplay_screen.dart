import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/word_entity.dart';
import '../../../domain/entities/game_room_entity.dart';

class GameplayScreen extends ConsumerStatefulWidget {
  final GameRoomEntity gameRoom;
  final WordEntity currentWord;

  const GameplayScreen({
    super.key,
    required this.gameRoom,
    required this.currentWord,
  });

  @override
  ConsumerState<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends ConsumerState<GameplayScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _answerFocus = FocusNode();
  
  late Timer _timer;
  late int _timeRemaining;
  late AnimationController _pulseController;
  
  int _score = 0;
  int _hintsUsed = 0;
  bool _isAnswering = false;
  String? _feedback;

  @override
  void initState() {
    super.initState();
    _timeRemaining = widget.gameRoom.roundTimeLimit;
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    
    _startTimer();
    
    // Auto-focus answer field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _answerFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pulseController.dispose();
    _answerController.dispose();
    _answerFocus.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        _handleTimeout();
      }
    });
  }

  void _handleTimeout() {
    _timer.cancel();
    _showFeedback('Time\'s up!', false);
    Future.delayed(const Duration(seconds: 2), () {
      _nextRound();
    });
  }

  void _submitAnswer() {
    if (_isAnswering || _answerController.text.trim().isEmpty) return;

    setState(() {
      _isAnswering = true;
    });

    final answer = _answerController.text.trim();
    final isCorrect = widget.currentWord.isCorrectAnswer(answer);
    
    if (isCorrect) {
      _timer.cancel();
      
      final timeTaken = widget.gameRoom.roundTimeLimit - _timeRemaining;
      final earnedScore = widget.currentWord.calculateScore(
        Duration(seconds: timeTaken),
        widget.gameRoom.roundTimeLimit,
      );
      
      setState(() {
        _score += earnedScore;
      });
      
      _showFeedback('Correct! +$earnedScore', true);
      
      // TODO: Submit to backend
      
      Future.delayed(const Duration(seconds: 2), () {
        _nextRound();
      });
    } else {
      _showFeedback('Incorrect! Try again', false);
      setState(() {
        _isAnswering = false;
      });
      _answerController.clear();
    }
  }

  void _showFeedback(String message, bool isSuccess) {
    setState(() {
      _feedback = message;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? AppColors.success : AppColors.error,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _useHint() {
    if (_hintsUsed >= widget.gameRoom.hintsPerRound) {
      _showFeedback('No hints remaining!', false);
      return;
    }

    setState(() {
      _hintsUsed++;
    });
    
    // TODO: Get hint from backend
    _showFeedback('Hint: First letter is ${widget.currentWord.word[0]}', true);
  }

  void _nextRound() {
    // TODO: Navigate to next round or results
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final room = widget.gameRoom;
    final word = widget.currentWord;
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar
              _buildTopBar(room),
              
              // Main Game Area
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Timer Circle
                      _buildTimerCircle(),
                      
                      const SizedBox(height: 40),
                      
                      // Word Display
                      _buildWordDisplay(word),
                      
                      const SizedBox(height: 40),
                      
                      // Answer Input
                      _buildAnswerInput(),
                      
                      const SizedBox(height: 24),
                      
                      // Action Buttons
                      _buildActionButtons(),
                      
                      const SizedBox(height: 32),
                      
                      // Players Progress
                      _buildPlayersProgress(room),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(GameRoomEntity room) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Round Counter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Round ${room.currentRound}/${room.totalRounds}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Score
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  _score.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          
          // Hints Remaining
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb, color: Colors.yellow, size: 20),
                const SizedBox(width: 4),
                Text(
                  '${room.hintsPerRound - _hintsUsed}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: -0.2);
  }

  Widget _buildTimerCircle() {
    final percentage = _timeRemaining / widget.gameRoom.roundTimeLimit;
    final isLowTime = _timeRemaining <= 10;
    
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: isLowTime
                ? [
                    BoxShadow(
                      color: AppColors.error.withOpacity(0.3 + (_pulseController.value * 0.3)),
                      blurRadius: 20 + (_pulseController.value * 10),
                      spreadRadius: 5 + (_pulseController.value * 5),
                    ),
                  ]
                : [],
          ),
          child: Stack(
            children: [
              // Background Circle
              SizedBox.expand(
                child: CircularProgressIndicator(
                  value: percentage,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isLowTime ? AppColors.error : Colors.white,
                  ),
                  strokeWidth: 8,
                ),
              ),
              
              // Time Text
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _timeRemaining.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isLowTime ? 48 : 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'seconds',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ).animate().scale(duration: 600.ms);
  }

  Widget _buildWordDisplay(WordEntity word) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          // Category Badge
          if (word.categories.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                word.categories.first.name.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          
          const SizedBox(height: 20),
          
          // Word Pattern
          Text(
            word.displayPattern,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 12),
          
          // Word Length Hint
          Text(
            '${word.wordLength} letters',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).scale();
  }

  Widget _buildAnswerInput() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _answerController,
              focusNode: _answerFocus,
              enabled: !_isAnswering,
              textCapitalization: TextCapitalization.characters,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              decoration: const InputDecoration(
                hintText: 'TYPE YOUR ANSWER',
                hintStyle: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
              onSubmitted: (_) => _submitAnswer(),
            ),
          ),
          
          // Submit Button
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: ElevatedButton(
              onPressed: _isAnswering ? null : _submitAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isAnswering
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Icon(Icons.send, size: 24),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2);
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Hint Button
        OutlinedButton.icon(
          onPressed: (_hintsUsed < widget.gameRoom.hintsPerRound) ? _useHint : null,
          icon: const Icon(Icons.lightbulb_outline),
          label: const Text('Hint'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white, width: 2),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _buildPlayersProgress(GameRoomEntity room) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Players',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        
        ...room.players.map((player) => _buildPlayerProgressCard(player)),
      ],
    ).animate().fadeIn(delay: 800.ms);
  }

  Widget _buildPlayerProgressCard(PlayerState player) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Text(
              player.username[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          Expanded(
            child: Text(
              player.username,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  player.score.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
