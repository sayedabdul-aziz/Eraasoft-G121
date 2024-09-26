import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';

TextStyle getHeadlineTextStyle(
    {double fontSize = 24, fontWeight = FontWeight.bold, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.color1,
  );
}

// title

TextStyle getTitleStyle(
    {double fontSize = 18, fontWeight = FontWeight.bold, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.color1,
  );
}

TextStyle getbodyStyle(
    {double fontSize = 16, fontWeight = FontWeight.normal, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.black,
  );
}
// small

TextStyle getSmallStyle(
    {double fontSize = 14, fontWeight = FontWeight.normal, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color ?? AppColors.black,
  );
}
