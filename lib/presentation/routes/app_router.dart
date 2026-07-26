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
