import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width = double.infinity,
      this.height = 50,
      required this.text,
      required this.onTap,
      this.textStyle,
      this.color = AppColors.primaryColor,
      this.radius = 8,
      this.isOutline = false});
  final double width;
  final double height;
  final String text;
  final Function() onTap;
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
            backgroundColor: isOutline ? AppColors.whiteColor : color,
            shape: RoundedRectangleBorder(
              side: isOutline
                  ? const BorderSide(color: AppColors.textColor)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: textStyle ??
                getBodyTextStyle(context,
                    color:
                        isOutline ? AppColors.textColor : AppColors.whiteColor),
          )),
    );
  }
}
