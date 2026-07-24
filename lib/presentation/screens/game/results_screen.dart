import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/game_room_entity.dart';

class GameResult {
  final String userId;
  final String username;
  final String? avatarUrl;
  final int finalScore;
  final int correctAnswers;
  final int wrongAnswers;
  final int rank;
  final int coinsEarned;
  final int xpEarned;

  const GameResult({
    required this.userId,
    required this.username,
    this.avatarUrl,
    required this.finalScore,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.rank,
    required this.coinsEarned,
    required this.xpEarned,
  });
}

class ResultsScreen extends StatefulWidget {
  final List<GameResult> results;
  final String currentUserId;
  final GameMode gameMode;

  const ResultsScreen({
    super.key,
    required this.results,
    required this.currentUserId,
    required this.gameMode,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late GameResult _myResult;
  
  @override
  void initState() {
    super.initState();
    _myResult = widget.results.firstWhere(
      (r) => r.userId == widget.currentUserId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final topThree = widget.results.take(3).toList();
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Winner Podium
                      _buildPodium(topThree),
                      
                      const SizedBox(height: 32),
                      
                      // My Result Card
                      _buildMyResultCard(),
                      
                      const SizedBox(height: 24),
                      
                      // All Rankings
                      _buildAllRankings(),
                      
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              
              // Bottom Actions
              _buildBottomActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            _myResult.rank == 1 ? Icons.emoji_events : Icons.flag,
            color: Colors.amber,
            size: 64,
          ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
          
          const SizedBox(height: 12),
          
          Text(
            _myResult.rank == 1 ? 'Victory!' : 'Game Over',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(delay: 200.ms),
          
          const SizedBox(height: 8),
          
          Text(
            _getRankText(_myResult.rank),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ).animate().fadeIn(delay: 300.ms),
        ],
      ),
    );
  }

  Widget _buildPodium(List<GameResult> topThree) {
    if (topThree.isEmpty) return const SizedBox();
    
    return Container(
      height: 280,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 2nd Place
          if (topThree.length > 1)
            _buildPodiumPlace(topThree[1], 2, 180, AppColors.silver)
                .animate(delay: 400.ms)
                .slideY(begin: 0.5, duration: 600.ms, curve: Curves.easeOut),
          
          const SizedBox(width: 12),
          
          // 1st Place
          _buildPodiumPlace(topThree[0], 1, 220, AppColors.gold)
              .animate(delay: 200.ms)
              .slideY(begin: 0.5, duration: 600.ms, curve: Curves.easeOut),
          
          const SizedBox(width: 12),
          
          // 3rd Place
          if (topThree.length > 2)
            _buildPodiumPlace(topThree[2], 3, 150, AppColors.bronze)
                .animate(delay: 600.ms)
                .slideY(begin: 0.5, duration: 600.ms, curve: Curves.easeOut),
        ],
      ),
    );
  }

  Widget _buildPodiumPlace(GameResult result, int rank, double height, Color color) {
    return Expanded(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: rank == 1 ? 40 : 32,
                  backgroundColor: color.withOpacity(0.2),
                  child: result.avatarUrl != null
                      ? ClipOval(
                          child: Image.network(
                            result.avatarUrl!,
                            width: rank == 1 ? 80 : 64,
                            height: rank == 1 ? 80 : 64,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Text(
                          result.username[0].toUpperCase(),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: rank == 1 ? 32 : 24,
                          ),
                        ),
                ),
                
                Positioned(
                  top: -8,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Text(
                      rank.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Text(
              result.username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 4),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  result.finalScore.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${result.correctAnswers} correct',
                style: const TextStyle(
                  color: AppColors.success,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyResultCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _getRankColor(_myResult.rank),
            _getRankColor(_myResult.rank).withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Your Performance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem(Icons.star, _myResult.finalScore.toString(), 'Score'),
              _statItem(Icons.check_circle, _myResult.correctAnswers.toString(), 'Correct'),
              _statItem(Icons.cancel, _myResult.wrongAnswers.toString(), 'Wrong'),
            ],
          ),
          
          const SizedBox(height: 20),
          
          const Divider(color: Colors.white30),
          
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _rewardItem(Icons.monetization_on, _myResult.coinsEarned.toString(), 'Coins', AppColors.coin),
              _rewardItem(Icons.trending_up, _myResult.xpEarned.toString(), 'XP', Colors.blue),
            ],
          ),
        ],
      ),
    ).animate(delay: 800.ms).fadeIn().slideY(begin: 0.2);
  }

  Widget _statItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
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
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _rewardItem(IconData icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '+$value',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAllRankings() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Players',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 16),
          
          ...widget.results.map((result) => _buildRankingRow(result)),
        ],
      ),
    ).animate(delay: 1000.ms).fadeIn();
  }

  Widget _buildRankingRow(GameResult result) {
    final isMe = result.userId == widget.currentUserId;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isMe ? AppColors.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: _getRankColor(result.rank).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '#${result.rank}',
                style: TextStyle(
                  color: _getRankColor(result.rank),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Avatar & Name
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary.withOpacity(0.2),
            child: Text(
              result.username[0].toUpperCase(),
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          Expanded(
            child: Text(
              result.username + (isMe ? ' (You)' : ''),
              style: TextStyle(
                fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          
          // Score
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  result.finalScore.toString(),
                  style: const TextStyle(
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

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Play again logic
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Play Again',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate(delay: 1200.ms).fadeIn().slideY(begin: 0.3);
  }

  String _getRankText(int rank) {
    if (rank == 1) return 'You are the champion!';
    if (rank <= 3) return 'Great job! You made the podium!';
    if (rank <= 5) return 'Nice performance! Top 5!';
    return 'Good effort! Keep practicing!';
  }

  Color _getRankColor(int rank) {
    if (rank == 1) return AppColors.gold;
    if (rank == 2) return AppColors.silver;
    if (rank == 3) return AppColors.bronze;
    return AppColors.primary;
  }
}
