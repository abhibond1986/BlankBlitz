import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/game/enhanced_practice_screen.dart';
import '../screens/game/lobby_screen.dart';
import '../screens/game/gameplay_screen.dart';
import '../screens/game/results_screen.dart';
import '../screens/coming_soon_screen.dart';
import '../screens/multiplayer/matchmaking_screen.dart';
import '../screens/multiplayer/multiplayer_lobby_screen.dart';
import '../../domain/entities/game_room_entity.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/practice',
      name: 'practice',
      builder: (context, state) => const EnhancedPracticeScreen(),
    ),
    GoRoute(
      path: '/quick-match',
      name: 'quickMatch',
      builder: (context, state) => const MatchmakingScreen(),
    ),
    GoRoute(
      path: '/multiplayer-lobby',
      name: 'multiplayerLobby',
      builder: (context, state) {
        final gameRoom = state.extra as GameRoomEntity;
        return MultiplayerLobbyScreen(gameRoom: gameRoom);
      },
    ),
    GoRoute(
      path: '/multiplayer-game',
      name: 'multiplayerGame',
      builder: (context, state) {
        final gameRoom = state.extra as GameRoomEntity;
        return EnhancedPracticeScreen(); // Will use this for now, can create multiplayer version later
      },
    ),
    GoRoute(
      path: '/private-room',
      name: 'privateRoom',
      builder: (context, state) => const ComingSoonScreen(
        featureName: 'Private Room',
        description: 'Create your own private room and invite friends to play together. Customize game settings, choose categories, and enjoy exclusive matches with your squad!',
        icon: Icons.group,
        gradient: LinearGradient(
          colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
        ),
      ),
    ),
    GoRoute(
      path: '/battle-royale',
      name: 'battleRoyale',
      builder: (context, state) => const ComingSoonScreen(
        featureName: 'Battle Royale',
        description: 'Enter the ultimate word battle arena with 20-100 players! Survive elimination rounds, be the last one standing, and claim massive rewards. The hottest game mode!',
        icon: Icons.emoji_events,
        gradient: LinearGradient(
          colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
        ),
      ),
    ),
    GoRoute(
      path: '/tournament',
      name: 'tournament',
      builder: (context, state) => const ComingSoonScreen(
        featureName: 'Tournament',
        description: 'Compete in official tournaments for glory and exclusive prizes. Climb the ranks, face the best players, and become a BlankBlitz champion!',
        icon: Icons.military_tech,
        gradient: LinearGradient(
          colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
        ),
      ),
    ),
    GoRoute(
      path: '/lobby',
      name: 'lobby',
      builder: (context, state) {
        final extra = state.extra;
        if (extra is GameRoomEntity) {
          return LobbyScreen(gameRoom: extra);
        }
        // Fallback with mock data
        return LobbyScreen(
          gameRoom: GameRoomEntity(
            id: 'room_123',
            roomCode: 'ROOM123',
            hostId: 'user_1',
            gameMode: GameMode.quickMatch,
            status: GameStatus.waiting,
            visibility: RoomVisibility.public,
            players: const [],
            maxPlayers: 4,
            currentRound: 0,
            totalRounds: 10,
            roundTimeLimit: 30,
            difficulty: 'MEDIUM',
            categories: const [],
            createdAt: DateTime.now(),
            startedAt: null,
            finishedAt: null,
          ),
        );
      },
    ),
    GoRoute(
      path: '/results',
      name: 'results',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final results = extra?['results'] as List<GameResult>? ?? [
          const GameResult(
            userId: 'user_1',
            username: 'Player 1',
            finalScore: 1000,
            correctAnswers: 8,
            wrongAnswers: 2,
            rank: 1,
            coinsEarned: 100,
            xpEarned: 250,
          ),
        ];
        return ResultsScreen(
          results: results,
          currentUserId: extra?['currentUserId'] ?? 'user_1',
          gameMode: extra?['gameMode'] ?? GameMode.quickMatch,
        );
      },
    ),
  ],
  redirect: (context, state) {
    // TODO: Add authentication check here
    return null;
  },
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.toString()}'),
    ),
  ),
);
