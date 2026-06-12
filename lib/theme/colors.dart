import 'package:flutter/material.dart';

class AppColors {
  // Accent (Swapped to Facebook Vibrant Blue & Deep Blue)
  static const lime = Color(0xFF1877F2);     // Facebook Primary Blue
  static const limeDeep = Color(0xFF0056B3); // Focused / Darker Press State Blue

  // Light Theme (Clean Facebook Light Palette)
  static const lightPrimary = Color(0xFFF0F2F5); // Facebook Background Grey
  static const lightOnPrimary = Color(0xFF050505); // High Contrast Dark Text
  static const lightPrimaryContainer = Color(0xFF050505);
  static const lightOnPrimaryContainer = Color(0xFFF0F2F5);
  static const lightSecondary = Color(0xFF1877F2);
  static const lightOnSecondary = Color(0xFFFFFFFF);
  static const lightSecondaryContainer = Color(0xFFE7F3FF); // Light Blue Container
  static const lightOnSecondaryContainer = Color(0xFF1877F2);
  static const lightTertiary = Color(0xFF65676B); // Secondary Grey Text
  static const lightOnTertiary = Color(0xFFFFFFFF);
  static const lightTertiaryContainer = Color(0xFFE4E6EB);
  static const lightOnTertiaryContainer = Color(0xFF050505);
  static const lightError = Color(0xFFFA383E); // Facebook Error Red
  static const lightOnError = Color(0xFFFFFFFF);
  static const lightErrorContainer = Color(0xFFFFEBEB);
  static const lightOnErrorContainer = Color(0xFFFA383E);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightOnSurface = Color(0xFF050505);
  static const lightSurfaceDim = Color(0xFFE4E6EB);
  static const lightOutline = Color(0xFFCED0D4);
  static const lightShadow = Color(0xFF000000);
  static const lightScrim = Color(0x80000000);
  static const lightInverseSurface = Color(0xFF050505);
  static const lightOnInverseSurface = Color(0xFFF0F2F5);
  static const lightInversePrimary = Color(0xFF1877F2);

  // Dark Theme (Rich Deep Midnight Facebook Dark Base)
  static const darkPrimary = Color(0xFF18191A); // Facebook Dark Surface
  static const darkOnPrimary = Color(0xFFE4E6EB);
  static const darkPrimaryContainer = Color(0xFF242526); // Facebook Card Dark Grey
  static const darkOnPrimaryContainer = Color(0xFFE4E6EB);
  static const darkSecondary = Color(0xFF1877F2); // Punchy Facebook Blue
  static const darkOnSecondary = Color(0xFFFFFFFF);
  static const darkSecondaryContainer = Color(0xFF263951); // Dark Blue Interactive Fill
  static const darkOnSecondaryContainer = Color(0xFF4599FF);
  static const darkTertiary = Color(0xFFB0B3B8); // Muted Dark Grey Text
  static const darkOnTertiary = Color(0xFF18191A);
  static const darkTertiaryContainer = Color(0xFF3A3B3C);
  static const darkOnTertiaryContainer = Color(0xFFE4E6EB);
  static const darkError = Color(0xFFFA383E);
  static const darkOnError = Color(0xFFFFFFFF);
  static const darkErrorContainer = Color(0xFF511F21);
  static const darkOnErrorContainer = Color(0xFFFFEBEB);
  static const darkSurface = Color(0xFF18191A); // Solid Dark Mode Background
  static const darkOnSurface = Color(0xFFE4E6EB);
  static const darkSurfaceDim = Color(0xFF0F0F10);
  static const darkOutline = Color(0xFF3A3B3C);
  static const darkShadow = Color(0xDE000000);
  static const darkScrim = Color(0xDE000000);
  static const darkInverseSurface = Color(0xFFE4E6EB);
  static const darkOnInverseSurface = Color(0xFF18191A);
  static const darkInversePrimary = Color(0xFF18191A);
}

extension PortfolioColorAlpha on Color {
  Color withAlphaFraction(double alpha) => withValues(alpha: alpha);
}