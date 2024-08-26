import 'package:flutter/material.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteColor, centerTitle: true),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.blackColor,
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: AppColors.whiteColor,
        headerForegroundColor: AppColors.primaryColor,
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.whiteColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )),
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkScaffoldBg,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkScaffoldBg, centerTitle: true),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.whiteColor,
      ),
      datePickerTheme: const DatePickerThemeData(
          backgroundColor: AppColors.darkScaffoldBg,
          headerForegroundColor: AppColors.primaryColor),
      timePickerTheme: const TimePickerThemeData(
          backgroundColor: AppColors.darkScaffoldBg,
          dialBackgroundColor: AppColors.darkAccent,
          hourMinuteTextColor: AppColors.primaryColor,
          dayPeriodColor: AppColors.darkAccent,
          hourMinuteColor: AppColors.darkAccent,
          dayPeriodTextColor: AppColors.primaryColor),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )),
      ));
}
