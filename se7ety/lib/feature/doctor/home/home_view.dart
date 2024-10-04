import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';

class DoctorHomeView extends StatefulWidget {
  const DoctorHomeView({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DoctorHomeView> {
  User? user;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.notifications_active,
                  color: AppColors.black),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'صــــــحّـتــي',
          style: getTitleStyle(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: 'مرحبا، ',
                      style: getbodyStyle(fontSize: 18),
                    ),
                    TextSpan(
                      text: user?.displayName,
                      style: getTitleStyle(),
                    ),
                  ],
                )),
                Text("الآن وكن جزءًا من رحلتك الصحية.",
                    style: getTitleStyle(color: AppColors.black, fontSize: 25)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
