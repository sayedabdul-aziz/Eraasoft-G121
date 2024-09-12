import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/page/login_view.dart';
import 'package:bookia_app/feature/auth/presentation/page/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsIcons.welcomeBg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  SvgPicture.asset(AssetsIcons.logoSvg),
                  const Gap(15),
                  Text(
                    'Order Your Book Now!',
                    style: getBodyTextStyle(context),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  CustomButton(
                      text: 'Login',
                      onTap: () {
                        push(context, const LoginView());
                      }),
                  const Gap(15),
                  CustomButton(
                      isOutline: true,
                      text: 'Register',
                      onTap: () {
                        push(context, const RegisterView());
                      }),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
