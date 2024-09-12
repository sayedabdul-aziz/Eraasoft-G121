import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        const Gap(10),
        Text(
          text,
          style: getSmallTextStyle(context),
        ),
        const Gap(10),
        const Expanded(child: Divider()),
      ],
    );
  }
}
