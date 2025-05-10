// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

// --- Color Definitions ---
class _AppColors {
  static const Color primaryOrange = Color(0xFFF39C12);
  static const Color primaryOrangeDarker = Color(0xFFD68910);
  static const Color primaryOrangeLighter = Color(0xFFFFC268);

  static const Color darkBackground = Color(0xFF121212); // Very dark grey, almost black
  static const Color slightlyLighterDark = Color(0xFF1E1E1E); // For cards, app bars
  static const Color surfaceDark = Color(0xFF2C2C2C); // For elements like filter button

  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xB3FFFFFF); // White70 for less emphasis
  static const Color textDisabledDark = Color(0x61FFFFFF); // White38 for disabled states
  static const Color textOnPrimaryOrange = Colors.black; // Text on orange buttons

  static const Color iconPrimaryDark = Colors.white70;
  static const Color iconSecondaryDark = Colors.white54;

  // Semantic colors
  static const Color success = Colors.green;
  static const Color error = Colors.red;
  static const Color warning = Colors.amber;
}

// --- Typography Definitions ---
class AppTextStyles {
  static const String _fontFamily = 'Inter';

  static const TextStyle logo = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: _AppColors.textPrimaryDark,
    letterSpacing: 0.5,
  );

  static const TextStyle pageTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 26,
    color: _AppColors.textPrimaryDark,
  );

  static const TextStyle webNavLink = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: _AppColors.textSecondaryDark,
  );

  static const TextStyle webNavLinkSelected = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: _AppColors.primaryOrange,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: _AppColors.textPrimaryDark,
    height: 1.3,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: _AppColors.textSecondaryDark,
  );

  static const TextStyle cardStatus = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: _AppColors.textPrimaryDark,
  );

  static const TextStyle cardInfoText = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: _AppColors.textSecondaryDark,
  );

  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    color: _AppColors.textOnPrimaryOrange,
  );

  static const TextStyle smallHelperText = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 11,
    color: _AppColors.textSecondaryDark,
  );

  static const TextStyle userProfileName = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: _AppColors.textPrimaryDark,
  );
}

// --- Main Theme Data ---
ThemeData getAppThemeData() {
  final baseTheme = ThemeData.dark();

  return baseTheme.copyWith(
    brightness: Brightness.dark,
    primaryColor: _AppColors.primaryOrange,
    scaffoldBackgroundColor: _AppColors.darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: _AppColors.primaryOrange,
      onPrimary: _AppColors.textOnPrimaryOrange,
      secondary: _AppColors.primaryOrangeDarker,
      onSecondary: _AppColors.textOnPrimaryOrange,
      surface: _AppColors.slightlyLighterDark,
      onSurface: _AppColors.textPrimaryDark,
      background: _AppColors.darkBackground,
      onBackground: _AppColors.textPrimaryDark,
      error: _AppColors.error,
      onError: _AppColors.textPrimaryDark,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: _AppColors.darkBackground,
      elevation: 0,
      iconTheme: const IconThemeData(color: _AppColors.iconPrimaryDark, size: 22),
      actionsIconTheme: const IconThemeData(color: _AppColors.iconPrimaryDark, size: 22),
      titleTextStyle: AppTextStyles.pageTitle.copyWith(fontSize: 20),
    ),

    // Text Theme
    textTheme: baseTheme.textTheme.copyWith(
      displayLarge: AppTextStyles.pageTitle.copyWith(fontSize: 32),
      displayMedium: AppTextStyles.pageTitle.copyWith(fontSize: 28),
      displaySmall: AppTextStyles.pageTitle,
      headlineMedium: AppTextStyles.cardTitle.copyWith(fontSize: 20),
      headlineSmall: AppTextStyles.cardTitle.copyWith(fontWeight: FontWeight.normal),
      titleLarge: AppTextStyles.logo.copyWith(fontSize: 22),
      bodyLarge: AppTextStyles.cardSubtitle.copyWith(fontSize: 15, color: _AppColors.textPrimaryDark),
      bodyMedium: AppTextStyles.cardSubtitle,
      labelLarge: AppTextStyles.button,
      bodySmall: AppTextStyles.smallHelperText.copyWith(color: const Color(0xFF999999)),
      titleMedium: AppTextStyles.userProfileName,
    ).apply(
      fontFamily: AppTextStyles._fontFamily,
      bodyColor: _AppColors.textPrimaryDark,
      displayColor: _AppColors.textPrimaryDark,
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: _AppColors.slightlyLighterDark,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.kCardBorderRadius),
      ),
      margin: const EdgeInsets.symmetric(vertical: AppConstants.kInterElementSpacing),
    ),

    // ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _AppColors.primaryOrangeLighter,
        foregroundColor: _AppColors.textOnPrimaryOrange,
        textStyle: AppTextStyles.button,
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.kCardPadding, vertical: AppConstants.kInterElementSpacingMedium), // Adjusted padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
        ),
        elevation: 2,
      ),
    ),

    // IconButton Theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: _AppColors.iconPrimaryDark,
        backgroundColor: Colors.transparent,
        highlightColor: _AppColors.primaryOrange.withOpacity(0.1),
        iconSize: 22,
      ),
    ),

    // Chip Theme (for "Pending Approval" status)
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0x0DC25F30),
      labelStyle: AppTextStyles.cardStatus.copyWith(fontSize: 12, color: _AppColors.textSecondaryDark),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.kChipBorderRadius),
        side: const BorderSide(
          color: _AppColors.primaryOrangeLighter,
          width: 1.0,
          style: BorderStyle.solid,
        ), // Optional border
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.kInterElementSpacing, vertical: 4),
      secondaryLabelStyle: AppTextStyles.cardStatus.copyWith(fontSize: 12, color: _AppColors.textSecondaryDark),
      secondarySelectedColor: _AppColors.primaryOrange, // Not directly used here but good to define
      selectedColor: _AppColors.primaryOrange,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _AppColors.surfaceDark,
      hintStyle: AppTextStyles.cardSubtitle.copyWith(color: _AppColors.textDisabledDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.kButtonBorderRadius),
        borderSide: const BorderSide(color: _AppColors.primaryOrange, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.kCardPadding, vertical: AppConstants.kInterElementSpacingMedium),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: _AppColors.iconPrimaryDark,
      size: 22,
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: _AppColors.surfaceDark.withOpacity(0.5),
      thickness: 1,
      space: 1, // No extra space by default, control with Padding
    ),

    // Dialog Theme
    dialogTheme: DialogTheme(
      backgroundColor: _AppColors.slightlyLighterDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.kDialogBorderRadius),
      ),
      titleTextStyle: AppTextStyles.cardTitle,
      contentTextStyle: AppTextStyles.cardSubtitle,
    ),
  );
}