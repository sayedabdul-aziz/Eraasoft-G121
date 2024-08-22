import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_8_19/core/functions/navigation.dart';
import 'package:taskati_8_19/core/services/local_storage.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/core/widgets/custom_button.dart';
import 'package:taskati_8_19/feature/home/page/home_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String? path;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  if (path != null && name.isNotEmpty) {
                    // add data to hive
                    AppLocalStorage.cacheData(AppLocalStorage.kName, name);
                    AppLocalStorage.cacheData(AppLocalStorage.kImage, path);
                    AppLocalStorage.cacheData(AppLocalStorage.kIsUpload, true);

                    pushWithReplacement(context, const HomeView());
                  } else if (path == null && name.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: AppColors.redColor,
                        content: Text('Please Upload Your Image')));
                  } else if (path != null && name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: AppColors.redColor,
                        content: Text('Please Enter Your Name')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: AppColors.redColor,
                        content: Text(
                            'Please Upload Your Image and Enter Your Name')));
                  }
                },
                child: Text(
                  'Done',
                  style: getBodyTextStyle(color: AppColors.primaryColor),
                ))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.primaryColor,
                    backgroundImage: (path != null)
                        ? FileImage(File(path ?? ''))
                        : const AssetImage('assets/user.png'),
                  ),
                  const Gap(20),
                  CustomButton(
                    text: 'Upload From Camera',
                    onPressed: () {
                      pickImage(true);
                    },
                  ),
                  const Gap(10),
                  CustomButton(
                    text: 'Upload From Gallery',
                    onPressed: () {
                      pickImage(false);
                    },
                  ),
                  const Gap(20),
                  const Divider(),
                  const Gap(20),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                    ),
                  )
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
      }
    });
  }
}
