import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/game/practice_screen.dart';
import '../screens/game/lobby_screen.dart';
import '../screens/game/gameplay_screen.dart';
import '../screens/game/results_screen.dart';

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
      builder: (context, state) => const PracticeScreen(),
    ),
    GoRoute(
      path: '/lobby',
      name: 'lobby',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return LobbyScreen(
          roomCode: extra?['roomCode'] ?? 'ROOM123',
          gameMode: extra?['gameMode'] ?? 'Quick Match',
        );
      },
    ),
    GoRoute(
      path: '/results',
      name: 'results',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return ResultsScreen(
          score: extra?['score'] ?? 0,
          correct: extra?['correct'] ?? 0,
          wrong: extra?['wrong'] ?? 0,
          totalRounds: extra?['totalRounds'] ?? 10,
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
      child: Text('Page not found: ${state.location}'),
    ),
  ),
);
