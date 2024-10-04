import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/doctor_card.dart';
import 'package:se7ety/feature/auth/data/models/doctor_model.dart';

class SearchHomeView extends StatefulWidget {
  final String searchKey;
  const SearchHomeView({super.key, required this.searchKey});

  @override
  _SearchHomeViewState createState() => _SearchHomeViewState();
}

class _SearchHomeViewState extends State<SearchHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.color1,
        foregroundColor: AppColors.white,
        title: Text(
          'ابحث عن دكتورك',
          style: getTitleStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('doctors')
              .orderBy('name')
              .startAt([widget.searchKey.trim()]).endAt(
                  ['${widget.searchKey.trim()}\uf8ff']).get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.data!.docs.isEmpty
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/no-search.svg',
                            width: 250,
                          ),
                          Text(
                            'لا يوجد دكتور بهذا الاسم',
                            style: getbodyStyle(),
                          ),
                        ],
                      ),
                    ),
                  )
                : Scrollbar(
                    child: ListView.builder(
                      itemCount: snapshot.data?.size,
                      itemBuilder: (context, index) {
                        DoctorModel doctor = DoctorModel.fromJson(
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>,
                        );
                        if (doctor.specialization == '') {
                          return const SizedBox();
                        }
                        return DoctorCard(
                          doctor: doctor,
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
