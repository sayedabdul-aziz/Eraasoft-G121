import 'package:flutter/material.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/feature/intro/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushReplacement(context, const OnboardingView());
      // if (token.isNotEmpty) {
      //   pushReplacement(context, const NavBarWidget());
      // } else {
      //   pushReplacement(context, const WelcomeView());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
