import 'package:flutter/material.dart';

class AppConstants {
  // Breakpoints
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 840.0;
  static const double webBreakpoint = 720.0;

  // Padding and Spacing
  static const double kScreenPadding = 24.0; // General padding for screen content
  static const double kCardPadding = 16.0; // Padding inside cards
  static const double kListItemSpacing = 16.0; // Spacing between items in a list or grid
  static const double kInterElementSpacing = 8.0; // Smaller spacing between elements
  static const double kInterElementSpacingMedium = 12.0;

  // Border Radius
  static const double kCardBorderRadius = 12.0;
  static const double kButtonBorderRadius = 100.0;
  static const double kChipBorderRadius = 100.0;
  static const double kDialogBorderRadius = 16.0;

  // Durations
  static const Duration kShortAnimationDuration = Duration(milliseconds: 300);

  // UI Element Sizes
  static const double webAppBarHeight = 64.0;
  static const double mobileAppBarHeight = 56.0;
  static const double avatarRadiusSmall = 12.0;
  static const double avatarRadiusMedium = 16.0;
}

// EdgeInsets constants
class AppEdgeInsets {
  static const EdgeInsets allSmall = EdgeInsets.all(AppConstants.kInterElementSpacing);
  static const EdgeInsets allMedium = EdgeInsets.all(AppConstants.kCardPadding);
  static const EdgeInsets allScreen = EdgeInsets.all(AppConstants.kScreenPadding);

  static const EdgeInsets symmetricHorizontalMedium = EdgeInsets.symmetric(horizontal: AppConstants.kCardPadding);
  static const EdgeInsets symmetricVerticalMedium = EdgeInsets.symmetric(vertical: AppConstants.kCardPadding);

  static const EdgeInsets symmetricHorizontalScreen = EdgeInsets.symmetric(horizontal: AppConstants.kScreenPadding);
  static const EdgeInsets symmetricVerticalScreen = EdgeInsets.symmetric(vertical: AppConstants.kScreenPadding);
}