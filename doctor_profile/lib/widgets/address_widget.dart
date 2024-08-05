import 'package:doctor_profile/colors.dart';
import 'package:doctor_profile/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          CustomTileWidget(
            text: 'Cairo Hospital',
            icon: Icons.local_hospital_rounded,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTileWidget(
            text: '11:00 AM - 12:00 PM',
            icon: Icons.watch_later_outlined,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTileWidget(
            text: 'Nasr City, Cairo',
            icon: Icons.location_on,
          ),
        ],
      ),
    );
  }
}
