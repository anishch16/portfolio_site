import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

TextTheme _buildTextTheme(Color displayColor, Color bodyColor) {
  return TextTheme(
    displayLarge: GoogleFonts.dmSans(
      fontSize: 72,
      fontWeight: FontWeight.w800,
      color: displayColor,
      letterSpacing: -2,
      height: 1.05,
    ),
    displayMedium: GoogleFonts.dmSans(
      fontSize: 52,
      fontWeight: FontWeight.w700,
      color: displayColor,
      letterSpacing: -1.5,
      height: 1.1,
    ),
    displaySmall: GoogleFonts.dmSans(
      fontSize: 38,
      fontWeight: FontWeight.w700,
      color: displayColor,
      letterSpacing: -1,
      height: 1.15,
    ),
    headlineLarge: GoogleFonts.dmSans(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: displayColor,
      letterSpacing: -0.5,
    ),
    headlineMedium: GoogleFonts.dmSans(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: displayColor,
      letterSpacing: -0.3,
    ),
    titleLarge: GoogleFonts.dmSans(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: displayColor,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      color: bodyColor,
      height: 1.75,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 14,
      color: bodyColor,
      height: 1.7,
    ),
    labelLarge: GoogleFonts.nunito(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: bodyColor,
      letterSpacing: 0.3,
    ),
    labelMedium: GoogleFonts.nunito(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: bodyColor,
      letterSpacing: 0.5,
    ),
  );
}

ThemeData buildLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      onPrimary: AppColors.lightOnPrimary,
      primaryContainer: AppColors.lightPrimaryContainer,
      onPrimaryContainer: AppColors.lightOnPrimaryContainer,
      secondary: AppColors.lightSecondary,
      onSecondary: AppColors.lightOnSecondary,
      secondaryContainer: AppColors.lightSecondaryContainer,
      onSecondaryContainer: AppColors.lightOnSecondaryContainer,
      tertiary: AppColors.lightTertiary,
      onTertiary: AppColors.lightOnTertiary,
      tertiaryContainer: AppColors.lightTertiaryContainer,
      onTertiaryContainer: AppColors.lightOnTertiaryContainer,
      error: AppColors.lightError,
      onError: AppColors.lightOnError,
      errorContainer: AppColors.lightErrorContainer,
      onErrorContainer: AppColors.lightOnErrorContainer,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightOnSurface,
      surfaceContainerHighest: AppColors.lightSurfaceDim,
      onSurfaceVariant: AppColors.lightOnSurface,
      outline: AppColors.lightOutline,
      shadow: AppColors.lightShadow,
      scrim: AppColors.lightScrim,
      inverseSurface: AppColors.lightInverseSurface,
      onInverseSurface: AppColors.lightOnInverseSurface,
      inversePrimary: AppColors.lightInversePrimary,
    ),
    textTheme: _buildTextTheme(
      AppColors.lightOnPrimary,
      const Color(0xFF444444),
    ),
  );
}

ThemeData buildDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkOnPrimary,
      primaryContainer: AppColors.darkPrimaryContainer,
      onPrimaryContainer: AppColors.darkOnPrimaryContainer,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnSecondary,
      secondaryContainer: AppColors.darkSecondaryContainer,
      onSecondaryContainer: AppColors.darkOnSecondaryContainer,
      tertiary: AppColors.darkTertiary,
      onTertiary: AppColors.darkOnTertiary,
      tertiaryContainer: AppColors.darkTertiaryContainer,
      onTertiaryContainer: AppColors.darkOnTertiaryContainer,
      error: AppColors.darkError,
      onError: AppColors.darkOnError,
      errorContainer: AppColors.darkErrorContainer,
      onErrorContainer: AppColors.darkOnErrorContainer,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
      surfaceContainerHighest: AppColors.darkSurfaceDim,
      onSurfaceVariant: AppColors.darkOnSurface,
      outline: AppColors.darkOutline,
      shadow: AppColors.darkShadow,
      scrim: AppColors.darkScrim,
      inverseSurface: AppColors.darkInverseSurface,
      onInverseSurface: AppColors.darkOnInverseSurface,
      inversePrimary: AppColors.darkInversePrimary,
    ),
    textTheme: _buildTextTheme(
      AppColors.darkOnPrimary,
      const Color(0xFFAAAAAA),
    ),
  );
}
