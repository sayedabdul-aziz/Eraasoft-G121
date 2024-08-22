import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_8_19/core/functions/navigation.dart';
import 'package:taskati_8_19/core/services/local_storage.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/feature/home/page/home_view.dart';
import 'package:taskati_8_19/feature/upload/upload_view.dart';

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
      pushWithReplacement(
          context,
          (AppLocalStorage.getCachedData(AppLocalStorage.kIsUpload) ?? false)
              ? const HomeView()
              : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset('assets/logo.json'),
          Text(
            'Taskati',
            style:
                getTitleTextStyle(fontSize: 24, color: AppColors.primaryColor),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          const Gap(10),
          Text(
            'It\'s time to be Organized!',
            style: getSmallTextStyle(),
          ),
        ]),
      ),
    );
  }
}
