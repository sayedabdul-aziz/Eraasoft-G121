import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width = double.infinity,
      this.height = 50,
      required this.text,
      required this.onPressed,
      this.textStyle,
      this.color = AppColors.color1,
      this.radius = 12,
      this.isOutline = false});
  final double width;
  final double height;
  final String text;
  final Function() onPressed;
  final TextStyle? textStyle;
  final Color color;
  final double radius;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isOutline ? AppColors.white : color,
            shape: RoundedRectangleBorder(
              side: isOutline
                  ? const BorderSide(color: AppColors.black)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle ??
                getbodyStyle(
                    color: isOutline ? AppColors.black : AppColors.white),
          )),
    );
  }
}
