import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/feature/auth/view/login_view.dart';
import 'package:flutter/material.dart';

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
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const LoginView();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGWfBW0D_yD9ojL1B9o86MZkY1dOyk6l4_uA&s',
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Chatify',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Made with ❤️ in Egypt',
                style: TextStyle(
                  fontSize: 14,
                )),
          ],
        ),
      ),
    );
  }
}
