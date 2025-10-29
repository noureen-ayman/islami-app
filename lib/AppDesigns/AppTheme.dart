import 'package:flutter/material.dart';
import 'package:islami/AppDesigns/AppColors.dart';

class AppThemes {
  static var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
    colorScheme: ColorScheme.dark(primary: AppColors.primary),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 36),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      selectedLabelStyle: TextStyle(color: AppColors.white),
      unselectedLabelStyle: TextStyle(color: AppColors.black),
      showSelectedLabels: true,
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.primary),
    scaffoldBackgroundColor: Colors.transparent,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey,

      floatingLabelBehavior: FloatingLabelBehavior.auto,

      hintStyle: TextStyle(
        color: AppColors.offWhite,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      contentPadding: EdgeInsets.all(20),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: AppColors.primary),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: AppColors.primary),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: AppColors.primary),
      ),
    ),
  );
}
