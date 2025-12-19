import 'package:flutter/material.dart';

class AppColors {
  // Primary MO Brand Colors
  static const Color primary = Color(0xFFE31E24);
  static const Color primaryDark = Color(0xFFB71C1C);
  static const Color primaryLight = Color(0xFFFFEBEE);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF1A1A2E);
  static const Color accent = Color(0xFFFFB800);
  static const Color accentLight = Color(0xFFFFF8E1);
  
  // Light Mode Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color surfaceLight = Color(0xFFF5F5F5);
  
  // Dark Mode Background Colors
  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardBackgroundDark = Color(0xFF1E1E1E);
  static const Color surfaceLightDark = Color(0xFF2C2C2C);
  
  // Light Mode Text Colors
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Colors.white;
  
  // Dark Mode Text Colors
  static const Color textPrimaryDark = Color(0xFFE5E5E5);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textLightDark = Color(0xFF808080);
  
  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFE31E24), Color(0xFFFF6B6B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFFFB800), Color(0xFFFFD54F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Helper methods to get colors based on theme
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? backgroundDark
        : background;
  }
  
  static Color getCardBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? cardBackgroundDark
        : cardBackground;
  }
  
  static Color getTextPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? textPrimaryDark
        : textPrimary;
  }
  
  static Color getTextSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? textSecondaryDark
        : textSecondary;
  }
  
  static Color getTextLightColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? textLightDark
        : textLight;
  }
}
