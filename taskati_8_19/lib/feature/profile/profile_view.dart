import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_8_19/core/services/local_storage.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/core/widgets/custom_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();
    path = AppLocalStorage.getCachedData(AppLocalStorage.kImage);
    name = AppLocalStorage.getCachedData(AppLocalStorage.kName) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: AppColors.primaryColor,
                        backgroundImage: (path != null)
                            ? FileImage(File(path ?? ''))
                            : const AssetImage('assets/user.png'),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppColors.whiteColor,
                                  builder: (context) {
                                    return Container(
                                      padding: const EdgeInsets.all(20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.whiteColor,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Gap(20),
                                          CustomButton(
                                              width: double.infinity,
                                              onPressed: () {
                                                pickImage(true);
                                                Navigator.pop(context);
                                              },
                                              text: 'Upload From Camera'),
                                          const Gap(15),
                                          CustomButton(
                                              width: double.infinity,
                                              onPressed: () {
                                                pickImage(false);
                                                Navigator.pop(context);
                                              },
                                              text: 'Upload From Gallery'),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteColor),
                                child: const Icon(Icons.camera_alt_rounded)),
                          )),
                    ],
                  ),
                  const Gap(40),
                  const Divider(
                    color: AppColors.primaryColor,
                  ),
                  const Gap(20),
                  Row(children: [
                    Text(
                      name,
                      style: getTitleTextStyle(color: AppColors.primaryColor),
                    ),
                    const Spacer(),
                    IconButton.outlined(
                      onPressed: () {},
                      color: AppColors.primaryColor,
                      icon: const Icon(Icons.edit),
                    )
                  ])
                ],
              ),
            ),
          ),
        ));
  }

  pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
        AppLocalStorage.cacheData(AppLocalStorage.kImage, path);
      }
    });
  }
}
