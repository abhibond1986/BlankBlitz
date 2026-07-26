import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/entities/game_room_entity.dart';

class PlayerStatsOverlay extends StatelessWidget {
  final List<PlayerState> players;
  final String currentUserId;

  const PlayerStatsOverlay({
    super.key,
    required this.players,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    // Sort players by score
    final sortedPlayers = List<PlayerState>.from(players)
      ..sort((a, b) => b.score.compareTo(a.score));

    return Positioned(
      top: 80,
      right: 16,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.leaderboard,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Live Rankings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Player list
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: sortedPlayers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final player = sortedPlayers[index];
                final isCurrentUser = player.userId == currentUserId;
                final rank = index + 1;

                return _PlayerStatRow(
                  player: player,
                  rank: rank,
                  isCurrentUser: isCurrentUser,
                );
              },
            ),
          ],
        ),
      ).animate().fadeIn().slideX(begin: 0.3),
    );
  }
}

class _PlayerStatRow extends StatelessWidget {
  final PlayerState player;
  final int rank;
  final bool isCurrentUser;

  const _PlayerStatRow({
    required this.player,
    required this.rank,
    required this.isCurrentUser,
  });

  Color get _rankColor {
    switch (rank) {
      case 1:
        return const Color(0xFFFBBF24); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return Colors.white60;
    }
  }

  IconData get _rankIcon {
    switch (rank) {
      case 1:
        return Icons.emoji_events;
      case 2:
        return Icons.military_tech;
      case 3:
        return Icons.workspace_premium;
      default:
        return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? const Color(0xFF6366F1).withOpacity(0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isCurrentUser
            ? Border.all(color: const Color(0xFF6366F1), width: 2)
            : null,
      ),
      child: Row(
        children: [
          // Rank icon
          Icon(
            _rankIcon,
            color: _rankColor,
            size: 18,
          ),
          const SizedBox(width: 6),

          // Player name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.username,
                  style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.white70,
                    fontSize: 12,
                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: const Color(0xFF10B981),
                      size: 10,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${player.correctAnswers}',
                      style: const TextStyle(
                        color: Color(0xFF10B981),
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.cancel,
                      color: const Color(0xFFEF4444),
                      size: 10,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${player.wrongAnswers}',
                      style: const TextStyle(
                        color: Color(0xFFEF4444),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Score
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: _rankColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${player.score}',
              style: TextStyle(
                color: _rankColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).animate(
      key: ValueKey('${player.userId}-${player.score}'),
    ).fadeIn(duration: 200.ms);
  }
}

// Compact version for tight spaces
class CompactPlayerStats extends StatelessWidget {
  final List<PlayerState> players;
  final String currentUserId;

  const CompactPlayerStats({
    super.key,
    required this.players,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final sortedPlayers = List<PlayerState>.from(players)
      ..sort((a, b) => b.score.compareTo(a.score));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: sortedPlayers.take(4).map((player) {
          final isCurrentUser = player.userId == currentUserId;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrentUser
                        ? const Color(0xFF6366F1)
                        : Colors.white24,
                    border: isCurrentUser
                        ? Border.all(color: const Color(0xFFFBBF24), width: 2)
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      player.username[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${player.score}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
