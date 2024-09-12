import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialButtonsCard extends StatelessWidget {
  const SocialButtonsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SocialCardItem(
          logo: AssetsIcons.facebookSvg,
        ),
        Gap(8),
        SocialCardItem(
          logo: AssetsIcons.googleSvg,
        ),
        Gap(8),
        SocialCardItem(
          logo: AssetsIcons.appleSvg,
        )
      ],
    );
  }
}

class SocialCardItem extends StatelessWidget {
  const SocialCardItem({super.key, required this.logo});
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.borderColor),
        ),
        child: SvgPicture.asset(logo),
      ),
    );
  }
}
