import 'package:flutter/material.dart';

class AppColors {
  static Color darkColor = const Color.fromRGBO(33, 31, 37, 1);
  static Color lightColor = const Color.fromRGBO(140, 150, 150, 1);
  static Color textColor = const Color.fromRGBO(83, 90, 90, 1);
  static Color lightBackground = Colors.white;
  static Color darkBackground = const Color.fromRGBO(235, 236, 240, 1);
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkColor),
  scaffoldBackgroundColor: AppColors.lightBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightBackground,
    foregroundColor: AppColors.darkColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: AppColors.lightBackground,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    unselectedItemColor: AppColors.lightColor,
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(color: AppColors.textColor, fontSize: 16),

    bodySmall: TextStyle(
      color: AppColors.textColor,
      fontSize: 14,
      letterSpacing: 1,
    ),

    headlineLarge: TextStyle(
      color: AppColors.darkColor,
      fontSize: 26,
      letterSpacing: 1.25,
      fontWeight: FontWeight.w800,
    ),

    headlineMedium: TextStyle(
      color: AppColors.darkColor,
      fontSize: 22,
      letterSpacing: .6,
      fontWeight: FontWeight.w800,
    ),

    titleSmall: TextStyle(
      color: AppColors.darkColor,
      fontSize: 14,
      letterSpacing: 1.25,
      fontWeight: FontWeight.w800,
    ),

    titleMedium: TextStyle(
      color: AppColors.darkColor,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
  ),
);
