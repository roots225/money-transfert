import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color success = Color(0xFFcaf99c);
  static const Color error = Color(0xFFf58965);
  static const Color succeedGreen = Color(0xFF14b56a);

  // ThemeData().colorScheme.copyWith( outline: AppColors.black,)

  // Default scheme
  static const ColorScheme darkScheme = ColorScheme.dark(
    outline: AppColors.black,
    onPrimary: AppColors.black,
    primary: AppColors.white,
  );
}
