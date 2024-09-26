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
        selectedItemColor: AppColors.color1,
        unselectedItemColor: AppColors.black,
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.color1, onSurface: AppColors.black),
      inputDecorationTheme: const InputDecorationTheme(
          fillColor: AppColors.accentColor,
          filled: true,
          suffixIconColor: AppColors.color1,
          prefixIconColor: AppColors.color1,
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
