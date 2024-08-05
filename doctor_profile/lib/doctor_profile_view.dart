import 'package:doctor_profile/colors.dart';
import 'package:doctor_profile/widgets/about_widget.dart';
import 'package:doctor_profile/widgets/address_widget.dart';
import 'package:doctor_profile/widgets/contact_widget.dart';
import 'package:doctor_profile/widgets/custom_button.dart';
import 'package:doctor_profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Doctor Profile',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              const ProfileHeaderWidget(),
              const SizedBox(height: 20),
              const AboutWidget(),
              const SizedBox(height: 20),
              const AddressDetailsWidget(),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 20),
              const ContactWidget(),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Chat With Dr. Ahmed',
                onTap: () {},
                bgColor: Colors.green,
              ),
              const SizedBox(height: 10),
              CustomButton(
                height: 50,
                text: 'Book Appointment',
                onTap: () {},
                bgColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
