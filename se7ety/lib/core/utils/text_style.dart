import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

TextStyle getHeadlineTextStyle(
    {double fontSize = 24, fontWeight = FontWeight.bold, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.primaryColor,
  );
}

// title

TextStyle getTitleStyle(
    {double fontSize = 18, fontWeight = FontWeight.bold, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.primaryColor,
  );
}

TextStyle getbodyStyle(
    {double fontSize = 16, fontWeight = FontWeight.normal, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.textColor,
  );
}
// small

TextStyle getSmallStyle(
    {double fontSize = 14, fontWeight = FontWeight.normal, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.textColor,
  );
}
