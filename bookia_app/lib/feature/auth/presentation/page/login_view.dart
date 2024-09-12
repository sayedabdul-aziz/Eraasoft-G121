import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/or_divider_widget.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_btns_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 41,
                height: 41,
                padding: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: getSmallTextStyle(context),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style:
                      getSmallTextStyle(context, color: AppColors.primaryColor),
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: getHeadlineTextStyle(context),
            ),
            const Gap(32),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            const Gap(15),
            TextFormField(
              obscureText: isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                suffixIconConstraints: const BoxConstraints(maxWidth: 33),
                suffixIcon: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: SvgPicture.asset('assets/icons/eye.svg')),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: getSmallTextStyle(context),
                    )),
              ],
            ),
            const Gap(30),
            CustomButton(
                text: 'Login',
                onTap: () {
                  pushAndRemoveUntil(context, const NavBarWidget());
                }),
            const Gap(30),
            const OrDividerWidget(
              text: 'Or Login with',
            ),
            const Gap(20),
            const SocialButtonsCard(),
          ],
        ),
      ),
    );
  }
}
