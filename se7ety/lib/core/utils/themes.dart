import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'cairo',
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textColor,
      ),
      colorScheme: ColorScheme.fromSeed(
  
          seedColor: AppColors.primaryColor, onSurface: AppColors.textColor),
      inputDecorationTheme: const InputDecorationTheme(
          fillColor: AppColors.accentColor,
          filled: true,
          hintStyle: TextStyle(
            fontSize: 15,
            color: AppColors.greyColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          )));
}
