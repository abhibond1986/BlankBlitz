import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color accent = Color(0xFFEC4899);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E293B);

  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);

  // Game Status Colors
  static const Color correct = Color(0xFF10B981);
  static const Color wrong = Color(0xFFEF4444);
  static const Color pending = Color(0xFFF59E0B);
  static const Color timeout = Color(0xFF6B7280);

  // Difficulty Colors
  static const Color easy = Color(0xFF10B981);
  static const Color medium = Color(0xFFF59E0B);
  static const Color hard = Color(0xFFEF4444);
  static const Color expert = Color(0xFF8B5CF6);

  // Currency Colors
  static const Color coin = Color(0xFFFBBF24);
  static const Color gem = Color(0xFF3B82F6);

  // Rank Colors
  static const Color bronze = Color(0xFFCD7F32);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color gold = Color(0xFFFFD700);
  static const Color platinum = Color(0xFFE5E4E2);
  static const Color diamond = Color(0xFFB9F2FF);
  static const Color master = Color(0xFF9333EA);
  static const Color grandmaster = Color(0xFFDC2626);
  static const Color legend = Color(0xFFFFA500);

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFEC4899), Color(0xFFF59E0B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient winGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
