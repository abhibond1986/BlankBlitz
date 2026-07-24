import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/config/app_config.dart';
import '../../providers/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

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
                  children: [
                    // User Avatar
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: user?.avatarUrl != null
                          ? ClipOval(
                              child: Image.network(
                                user!.avatarUrl!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              color: AppColors.primary,
                              size: 30,
                            ),
                    ),
                    const SizedBox(width: 12),
                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.username ?? 'Player',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _getRankColor(user?.rank ?? 'BRONZE'),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  user?.rank ?? 'BRONZE',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Level ${user?.level ?? 1}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Coins & Gems
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _CurrencyBadge(
                          icon: Icons.monetization_on,
                          value: user?.coins ?? 0,
                          color: AppColors.coin,
                        ),
                        const SizedBox(height: 4),
                        _CurrencyBadge(
                          icon: Icons.diamond,
                          value: user?.gems ?? 0,
                          color: AppColors.gem,
                        ),
                      ],
                    ),
                  ],
                ),
              ).animate().fadeIn().slideX(begin: -0.2),
              
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Welcome Message
                      Text(
                        'Choose Your Battle',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 200.ms),
                      
                      const SizedBox(height: 8),
                      
                      Text(
                        'Select a game mode to start playing',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 300.ms),
                      
                      const SizedBox(height: 32),
                      
                      // Game Modes Grid
                      _GameModeCard(
                        title: 'Solo Practice',
                        subtitle: 'Practice offline, unlimited words',
                        icon: Icons.person,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF10B981), Color(0xFF059669)],
                        ),
                        onTap: () {
                          context.push('/practice');
                        },
                      ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
                      
                      const SizedBox(height: 16),
                      
                      _GameModeCard(
                        title: 'Quick Match',
                        subtitle: '2-10 players, fast matchmaking',
                        icon: Icons.flash_on,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                        ),
                        onTap: () {
                          // TODO: Navigate to quick match
                        },
                      ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
                      
                      const SizedBox(height: 16),
                      
                      _GameModeCard(
                        title: 'Private Room',
                        subtitle: 'Play with friends, custom settings',
                        icon: Icons.group,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                        ),
                        onTap: () {
                          // TODO: Navigate to private room
                        },
                      ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2),
                      
                      const SizedBox(height: 16),
                      
                      _GameModeCard(
                        title: 'Battle Royale',
                        subtitle: '20-100 players, elimination mode',
                        icon: Icons.emoji_events,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                        ),
                        badge: 'HOT',
                        onTap: () {
                          // TODO: Navigate to battle royale
                        },
                      ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2),
                      
                      const SizedBox(height: 16),
                      
                      _GameModeCard(
                        title: 'Tournament',
                        subtitle: 'Compete for prizes and glory',
                        icon: Icons.military_tech,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                        ),
                        onTap: () {
                          // TODO: Navigate to tournament
                        },
                      ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2),
                    ],
                  ),
                ),
              ),
              
              // Bottom Navigation
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NavButton(
                      icon: Icons.home,
                      label: 'Home',
                      isActive: true,
                      onTap: () {},
                    ),
                    _NavButton(
                      icon: Icons.leaderboard,
                      label: 'Ranks',
                      onTap: () {
                        // TODO: Navigate to leaderboard
                      },
                    ),
                    _NavButton(
                      icon: Icons.shopping_bag,
                      label: 'Shop',
                      onTap: () {
                        // TODO: Navigate to shop
                      },
                    ),
                    _NavButton(
                      icon: Icons.person,
                      label: 'Profile',
                      onTap: () {
                        // TODO: Navigate to profile
                      },
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.3),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRankColor(String rank) {
    switch (rank.toUpperCase()) {
      case 'BRONZE':
        return AppColors.bronze;
      case 'SILVER':
        return AppColors.silver;
      case 'GOLD':
        return AppColors.gold;
      case 'PLATINUM':
        return AppColors.platinum;
      case 'DIAMOND':
        return AppColors.diamond;
      case 'MASTER':
        return AppColors.master;
      case 'GRANDMASTER':
        return AppColors.grandmaster;
      case 'LEGEND':
        return AppColors.legend;
      default:
        return AppColors.bronze;
    }
  }
}

class _CurrencyBadge extends StatelessWidget {
  final IconData icon;
  final int value;
  final Color color;

  const _CurrencyBadge({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _GameModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Gradient gradient;
  final String? badge;
  final VoidCallback onTap;

  const _GameModeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (badge != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              badge!,
                              style: TextStyle(
                                color: gradient.colors.first,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.7),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: isActive ? 26 : 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
