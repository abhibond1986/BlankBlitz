import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class ComingSoonScreen extends StatelessWidget {
  final String featureName;
  final String description;
  final IconData icon;
  final Gradient gradient;

  const ComingSoonScreen({
    super.key,
    required this.featureName,
    required this.description,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1E1B4B),
              const Color(0xFF312E81),
              const Color(0xFF6366F1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: gradient,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: gradient.colors.first.withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Icon(
                          icon,
                          size: 60,
                          color: Colors.white,
                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                        .scale(
                          duration: 2000.ms,
                          begin: const Offset(0.95, 0.95),
                          end: const Offset(1.05, 1.05),
                        ),

                      const SizedBox(height: 40),

                      // Feature Name
                      Text(
                        featureName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

                      const SizedBox(height: 16),

                      // Coming Soon Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          gradient: gradient,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: gradient.colors.first.withOpacity(0.5),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Text(
                          'COMING SOON',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ).animate().fadeIn(delay: 400.ms).scale(),

                      const SizedBox(height: 32),

                      // Description
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 600.ms),

                      const SizedBox(height: 48),

                      // Info Box
                      Container(
                        padding: const EdgeInsets.all(24),
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
                            Row(
                              children: [
                                Icon(
                                  Icons.construction,
                                  color: const Color(0xFFFBBF24),
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'We\'re working hard to bring you this feature!',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'In the meantime, try our Solo Practice mode to sharpen your skills!',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2),
                    ],
                  ),
                ),
              ),

              // Action Buttons
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Try Solo Practice Button
                    ElevatedButton(
                      onPressed: () {
                        context.go('/practice');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        shadowColor: const Color(0xFF10B981).withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person, size: 24),
                          SizedBox(width: 12),
                          Text(
                            'Try Solo Practice',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Back to Home Button
                    TextButton(
                      onPressed: () => context.pop(),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
