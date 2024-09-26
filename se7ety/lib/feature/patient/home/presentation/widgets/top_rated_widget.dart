import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/core/widgets/doctor_card.dart';

// Collection ?
//1) docId?
//2) list of documents
// a) orderBy  الترتيب
// b) where المقارنة
// c) startAt and endAt السيرش

class TopRatedList extends StatefulWidget {
  const TopRatedList({super.key});

  @override
  _TopRatedListState createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('doctors')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var doctor =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  
                if (doctor['name'] == '' || doctor['specialization'] == '') {
                  return const SizedBox();
                }
                return DoctorCard(
                    name: doctor['name'],
                    image: doctor['image'],
                    specialization: doctor['specialization'],
                    rating: doctor['rating'],
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DoctorProfile(
                      //       email: doctor['email'],
                      //     ),
                      //   ),
                      // );
                    });
              },
            );
          }
        },
      ),
    );
  }
}
