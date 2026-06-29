import 'package:flutter/material.dart';

class AppColors {
  // Primary brand identity colors
  static const Color primaryDarkBlue = Color(0xFF0F294A); // Phone backgrounds
  static const Color accentBlue = Color(0xFF1E88E5);      // Normal button state
  static const Color primaryOrange = Color(0xFFFB8C00);    // Card accents, highlighted selections
  
  // Backgrounds and cards
  static const Color backgroundLight = Color(0xFFF5F7FA);  // Light background scaffold
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);

  // Custom shadows to match the floating look in the image
  static List<BoxShadow> tightShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}