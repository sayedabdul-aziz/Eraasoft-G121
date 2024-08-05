import 'package:doctor_profile/colors.dart';
import 'package:doctor_profile/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Info',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            children: [
              CustomTileWidget(
                text: 'example@gmail.com',
                icon: Icons.email_rounded,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTileWidget(
                text: '010101010101',
                icon: Icons.call,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTileWidget(
                text: '0101010101010',
                icon: Icons.call,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
