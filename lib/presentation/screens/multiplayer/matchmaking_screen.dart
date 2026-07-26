import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/game_room_entity.dart';
import '../../providers/game_room_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_logo.dart';

class MatchmakingScreen extends ConsumerStatefulWidget {
  const MatchmakingScreen({super.key});

  @override
  ConsumerState<MatchmakingScreen> createState() => _MatchmakingScreenState();
}

class _MatchmakingScreenState extends ConsumerState<MatchmakingScreen> {
  bool _isSearching = false;
  int _playersFound = 0;
  String _statusMessage = 'Preparing matchmaking...';

  @override
  void initState() {
    super.initState();
    _startMatchmaking();
  }

  Future<void> _startMatchmaking() async {
    setState(() {
      _isSearching = true;
      _statusMessage = 'Searching for opponents...';
    });

    final user = ref.read(authProvider).user;
    if (user == null) {
      _showError('Please login first');
      return;
    }

    try {
      // Simulate searching animation
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _playersFound = 1;
        _statusMessage = 'Player found! Looking for more...';
      });

      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _playersFound = 2;
        _statusMessage = 'Great! Finding one more...';
      });

      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _playersFound = 3;
        _statusMessage = 'Almost there! Getting the last player...';
      });

      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _playersFound = 4;
        _statusMessage = 'Match found! Preparing game...';
      });

      // Create or join a quick match room
      await Future.delayed(const Duration(milliseconds: 500));

      final result = await ref.read(gameRoomProvider.notifier).quickMatch();

      result.fold(
        (failure) {
          _showError(failure.message);
        },
        (room) {
          // Navigate to lobby
          if (mounted) {
            context.go('/multiplayer-lobby', extra: room);
          }
        },
      );
    } catch (e) {
      _showError('Matchmaking failed: $e');
    }
  }

  void _showError(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFEF4444),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) context.pop();
    });
  }

  void _cancelMatchmaking() {
    // TODO: Cancel matchmaking in backend
    context.pop();
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
                    const Text(
                      'Quick Match',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Search Icon
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer ripple
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                            .scale(
                              duration: 2000.ms,
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1.2, 1.2),
                            ).fadeOut(begin: 0.5),

                          // Middle ripple
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                            .scale(
                              duration: 1500.ms,
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1.2, 1.2),
                            ).fadeOut(begin: 0.5),

                          // Inner circle with icon
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF6366F1).withOpacity(0.5),
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.search,
                              size: 60,
                              color: Colors.white,
                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                            .rotate(duration: 3000.ms),
                        ],
                      ),

                      const SizedBox(height: 48),

                      // Status Message
                      Text(
                        _statusMessage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ).animate(
                        key: ValueKey(_statusMessage),
                      ).fadeIn().slideY(begin: 0.2),

                      const SizedBox(height: 32),

                      // Players Found
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Players Found',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '$_playersFound',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  ' / 4',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ).animate(
                              key: ValueKey(_playersFound),
                            ).scale(
                              duration: 300.ms,
                              begin: const Offset(0.8, 0.8),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 48),

                      // Player Avatars
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          final isFound = index < _playersFound;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _PlayerAvatar(
                              isFound: isFound,
                              index: index,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // Cancel Button
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextButton(
                  onPressed: _cancelMatchmaking,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: Colors.white.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayerAvatar extends StatelessWidget {
  final bool isFound;
  final int index;

  const _PlayerAvatar({
    required this.isFound,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFound
            ? const Color(0xFF10B981)
            : Colors.white.withOpacity(0.1),
        border: Border.all(
          color: isFound ? const Color(0xFF10B981) : Colors.white.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Icon(
        isFound ? Icons.person : Icons.person_outline,
        color: isFound ? Colors.white : Colors.white30,
        size: 32,
      ),
    ).animate(
      key: ValueKey('$index-$isFound'),
    ).fadeIn().scale(
      duration: 300.ms,
      begin: const Offset(0.5, 0.5),
    );
  }
}
