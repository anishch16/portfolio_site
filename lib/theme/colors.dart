import 'package:flutter/material.dart';

class AppColors {
  // -- Light Theme Colors --
  static const lightPrimary = Color(0xFFFFFFFF); // pure white
  static const lightOnPrimary = Color(0xFF121212); // almost black, softer than pure black
  static const lightPrimaryContainer = Color(0xFF212121); // very dark gray instead of full black
  static const lightOnPrimaryContainer = Color(0xFFF5F5F5); // light gray near white

  static const lightSecondary = Color(0xFF03DAC6); // teal kept as is
  static const lightOnSecondary = Color(0xFF000000); // pure black for clarity
  static const lightSecondaryContainer = Color(0xFF66FFF9);
  static const lightOnSecondaryContainer = Color(0xFF000000);

  static const lightTertiary = Color(0xFF018786);
  static const lightOnTertiary = Color(0xFFFFFFFF);
  static const lightTertiaryContainer = Color(0xFF66FFF9);
  static const lightOnTertiaryContainer = Color(0xFF000000);

  static const lightError = Color(0xFFB00020);
  static const lightOnError = Color(0xFFFFFFFF);
  static const lightErrorContainer = Color(0xFFFCD8DF);
  static const lightOnErrorContainer = Color(0xFF370617);

  static const lightBackground = Color(0xFFFFFFFF); // white background
  static const lightOnBackground = Color(0xFF121212); // almost black text

  static const lightSurface = Color(0xFFF6F6F6);
  static const lightOnSurface = Color(0xFF121212);
  static const lightSurfaceDim = Color(0xFFE0E0E0);
  static const lightSurfaceBright = Color(0xFFFFFFFF);

  static const lightOutline = Color(0xFF757575); // mid gray for outlines
  static const lightShadow = Color(0xFF000000); // black shadow
  static const lightScrim = Color(0x80000000); // 50% opacity black scrim

  static const lightInverseSurface = Color(0xFF121212); // dark background for inverse
  static const lightOnInverseSurface = Color(0xFFF5F5F5); // light gray
  static const lightInversePrimary = Color(0xFFFFFFFF);
  static const lightSurfaceTint = Color(0xFFFFFFFF);

  // -- Dark Theme Colors --
  static const darkPrimary = Color(0xFF121212); // very dark gray, softer than black
  static const darkOnPrimary = Color(0xFFF5F5F5); // light gray
  static const darkPrimaryContainer = Color(0xFFE0E0E0); // light gray container
  static const darkOnPrimaryContainer = Color(0xFF121212);

  static const darkSecondary = Color(0xFF03DAC6);
  static const darkOnSecondary = Color(0xFF000000);
  static const darkSecondaryContainer = Color(0xFF005047);
  static const darkOnSecondaryContainer = Color(0xFFFFFFFF);

  static const darkTertiary = Color(0xFF03DAC6);
  static const darkOnTertiary = Color(0xFF000000);
  static const darkTertiaryContainer = Color(0xFF005047);
  static const darkOnTertiaryContainer = Color(0xFFFFFFFF);

  static const darkError = Color(0xFFCF6679);
  static const darkOnError = Color(0xFF000000);
  static const darkErrorContainer = Color(0xFFB1384D);
  static const darkOnErrorContainer = Color(0xFFFFFFFF);

  static const darkBackground = Color(0xFF121212);
  static const darkOnBackground = Color(0xFFF5F5F5);

  static const darkSurface = Color(0xFF212121); // dark gray surface
  static const darkOnSurface = Color(0xFFF5F5F5);
  static const darkSurfaceDim = Color(0xFF1E1E1E);
  static const darkSurfaceBright = Color(0xFF2C2C2C);

  static const darkOutline = Color(0xFF8F8F8F);
  static const darkShadow = Color(0xDE000000); // 87% opacity black
  static const darkScrim = Color(0xDE000000);

  static const darkInverseSurface = Color(0xFFF5F5F5);
  static const darkOnInverseSurface = Color(0xFF121212);
  static const darkInversePrimary = Color(0xFF121212);
  static const darkSurfaceTint = Color(0xFF121212);
}
