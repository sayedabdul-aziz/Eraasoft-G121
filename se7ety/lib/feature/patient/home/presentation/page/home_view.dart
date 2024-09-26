import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/home/presentation/widgets/specialists_widget.dart';
import 'package:se7ety/feature/patient/home/presentation/widgets/top_rated_widget.dart';

class PatientHomeView extends StatefulWidget {
  const PatientHomeView({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PatientHomeView> {
  final TextEditingController _doctorName = TextEditingController();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
              const Gap(10),
              Text("احجز الآن وكن جزءًا من رحلتك الصحية.",
                  style: getTitleStyle(color: AppColors.black, fontSize: 25)),
              const SizedBox(height: 15),

              // --------------- Search Bar --------------------------
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 15,
                      offset: const Offset(5, 5),
                    )
                  ],
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  controller: _doctorName,
                  cursorColor: AppColors.color1,
                  decoration: InputDecoration(
                    hintStyle: getbodyStyle(),
                    filled: true,
                    hintText: 'ابحث عن دكتور',
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: AppColors.color1.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        splashRadius: 20,
                        color: Colors.white,
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(
                            () {
                              // _doctorName.text.isEmpty
                              //     ? Container()
                              //     : Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) => SearchHomeView(
                              //             searchKey: _doctorName.text,
                              //           ),
                              //         ),
                              //       );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  style: getbodyStyle(),
                  onFieldSubmitted: (String value) {
                    setState(
                      () {
                        // _doctorName.text.isEmpty
                        //     ? Container()
                        //     : Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => SearchHomeView(
                        //             searchKey: _doctorName.text,
                        //           ),
                        //         ),
                        //       );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // ----------------  SpecialistsWidget --------------------,

              const SpecialistsBanner(),
              const SizedBox(
                height: 10,
              ),

              // ----------------  Top Rated --------------------,
              Text(
                "الأعلي تقييماً",
                textAlign: TextAlign.center,
                style: getTitleStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const TopRatedList(),
            ],
          ),
        ),
      ),
    );
  }
}
