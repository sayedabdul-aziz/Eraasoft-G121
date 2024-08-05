import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.bgColor,
    this.fgColor = Colors.white,
    this.height = 50,
  });
  final String text;
  final Function() onTap;
  final Color bgColor;
  final Color fgColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              backgroundColor: bgColor,
              foregroundColor: fgColor),
          onPressed: onTap,
          child: Text(text)),
    );
  }
}
