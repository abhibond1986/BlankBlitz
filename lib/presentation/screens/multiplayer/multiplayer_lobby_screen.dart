import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/game_room_entity.dart';
import '../../providers/game_room_provider.dart';
import '../../widgets/app_logo.dart';

class MultiplayerLobbyScreen extends ConsumerStatefulWidget {
  final GameRoomEntity gameRoom;

  const MultiplayerLobbyScreen({
    super.key,
    required this.gameRoom,
  });

  @override
  ConsumerState<MultiplayerLobbyScreen> createState() => _MultiplayerLobbyScreenState();
}

class _MultiplayerLobbyScreenState extends ConsumerState<MultiplayerLobbyScreen> {
  int _countdown = 5;
  bool _gameStarting = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  Future<void> _startCountdown() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _gameStarting = true;
    });

    for (int i = 5; i > 0; i--) {
      if (!mounted) return;

      setState(() {
        _countdown = i;
      });

      await Future.delayed(const Duration(seconds: 1));
    }

    if (mounted) {
      context.go('/multiplayer-game', extra: widget.gameRoom);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E1B4B),
              Color(0xFF312E81),
              Color(0xFF6366F1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Logo at top
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: AppLogo(size: 40),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Match Ready!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.gameRoom.roomCode,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!_gameStarting) const SizedBox(width: 48),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Players Grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Text(
                        'Players',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Player Cards
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: List.generate(
                            widget.gameRoom.players.length,
                            (index) {
                              final player = widget.gameRoom.players[index];
                              return _PlayerCard(
                                player: player,
                                isHost: player.isHost,
                              );
                            },
                          ),
                        ),
                      ),

                      if (_gameStarting) ...[
                        const SizedBox(height: 32),

                        // Countdown
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFBBF24).withOpacity(0.5),
                                blurRadius: 30,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '$_countdown',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ).animate(
                          key: ValueKey(_countdown),
                        ).scale(
                          duration: 200.ms,
                          begin: const Offset(0.8, 0.8),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Game starting...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ).animate().fadeIn(),
                      ],
                    ],
                  ),
                ),
              ),

              // Game Info
              if (!_gameStarting)
                Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _InfoItem(
                            icon: Icons.emoji_events,
                            label: 'Rounds',
                            value: '${widget.gameRoom.totalRounds}',
                          ),
                          _InfoItem(
                            icon: Icons.timer,
                            label: 'Time',
                            value: '${widget.gameRoom.roundTimeLimit}s',
                          ),
                          _InfoItem(
                            icon: Icons.speed,
                            label: 'Difficulty',
                            value: widget.gameRoom.difficulty,
                          ),
                        ],
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
}

class _PlayerCard extends StatelessWidget {
  final PlayerState player;
  final bool isHost;

  const _PlayerCard({
    required this.player,
    required this.isHost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isHost
              ? [const Color(0xFFFBBF24), const Color(0xFFF59E0B)]
              : [const Color(0xFF6366F1), const Color(0xFF4F46E5)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: player.avatarUrl != null
                ? ClipOval(
                    child: Image.network(
                      player.avatarUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: 32,
                    color: isHost ? const Color(0xFFFBBF24) : const Color(0xFF6366F1),
                  ),
          ),

          const SizedBox(height: 12),

          // Username
          Text(
            player.username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          // Host Badge
          if (isHost)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'HOST',
                style: TextStyle(
                  color: Color(0xFFFBBF24),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          const SizedBox(height: 8),

          // Ready Status
          Icon(
            player.isReady ? Icons.check_circle : Icons.pending,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    ).animate().fadeIn(delay: (100 * player.userId.hashCode % 400).ms).scale();
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
