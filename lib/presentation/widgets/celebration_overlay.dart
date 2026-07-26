import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class CelebrationOverlay extends StatefulWidget {
  final bool show;
  final bool isCorrect;
  final int points;
  final VoidCallback? onComplete;

  const CelebrationOverlay({
    super.key,
    required this.show,
    required this.isCorrect,
    this.points = 0,
    this.onComplete,
  });

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay> {
  @override
  void initState() {
    super.initState();
    if (widget.show && widget.isCorrect) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        widget.onComplete?.call();
      });
    } else if (widget.show && !widget.isCorrect) {
      Future.delayed(const Duration(milliseconds: 800), () {
        widget.onComplete?.call();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.show) return const SizedBox.shrink();

    return Stack(
      children: [
        // Background overlay
        Container(
          color: widget.isCorrect
              ? const Color(0xFF10B981).withOpacity(0.1)
              : const Color(0xFFEF4444).withOpacity(0.1),
        ),

        // Confetti (only for correct answers)
        if (widget.isCorrect) ...[
          ...List.generate(20, (index) {
            final random = math.Random(index);
            return Positioned(
              left: random.nextDouble() * MediaQuery.of(context).size.width,
              top: -50,
              child: _ConfettiPiece(
                color: [
                  const Color(0xFFFBBF24),
                  const Color(0xFF10B981),
                  const Color(0xFF6366F1),
                  const Color(0xFFEC4899),
                ][index % 4],
                delay: index * 50,
              ),
            );
          }),
        ],

        // Center message
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            decoration: BoxDecoration(
              color: widget.isCorrect
                  ? const Color(0xFF10B981)
                  : const Color(0xFFEF4444),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: (widget.isCorrect
                          ? const Color(0xFF10B981)
                          : const Color(0xFFEF4444))
                      .withOpacity(0.5),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.isCorrect ? Icons.check_circle : Icons.cancel,
                  size: 64,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.isCorrect ? 'CORRECT!' : 'WRONG!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                if (widget.isCorrect && widget.points > 0) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFBBF24),
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '+${widget.points}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ).animate().scale(
            duration: 300.ms,
            begin: const Offset(0.5, 0.5),
            curve: Curves.elasticOut,
          ),
        ),
      ],
    );
  }
}

class _ConfettiPiece extends StatelessWidget {
  final Color color;
  final int delay;

  const _ConfettiPiece({
    required this.color,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final random = math.Random(delay);
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: random.nextBool() ? BoxShape.circle : BoxShape.rectangle,
      ),
    ).animate().slideY(
      duration: 1500.ms,
      delay: delay.ms,
      begin: 0,
      end: 15,
      curve: Curves.easeInCubic,
    ).fadeIn(delay: delay.ms).fadeOut(
      duration: 500.ms,
      delay: 1000.ms,
    );
  }
}

// Floating points animation
class FloatingPoints extends StatelessWidget {
  final int points;
  final Color color;

  const FloatingPoints({
    super.key,
    required this.points,
    this.color = const Color(0xFF10B981),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '+$points',
      style: TextStyle(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
          ),
        ],
      ),
    ).animate().slideY(
      duration: 1000.ms,
      begin: 0,
      end: -2,
    ).fadeOut(
      duration: 500.ms,
      delay: 500.ms,
    );
  }
}
