import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0F172A);
  static const Color accent = Color(0xFF02569B);
  static const Color accentLight = Color(0xFF42A5F5);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color cardBackground = Color(0xFF1E293B);
  static const Color inputBackground = Color(0xFF334155);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Gradient colors
  static const Gradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}