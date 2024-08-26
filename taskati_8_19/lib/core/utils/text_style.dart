import 'package:flutter/material.dart';
import 'package:taskati_8_19/core/utils/colors.dart';

TextStyle getTitleTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.w600,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getBodyTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 16,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.accentColor,
  );
}
