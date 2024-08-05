import 'package:doctor_profile/colors.dart';
import 'package:doctor_profile/widgets/call_widget.dart';
import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
        const CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXy2ouPgmpbhCCFXtYVM5xKuX3e1-gGYWRFg&s',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Ahmed Tarek Tarek Tarek Tarek Tarek',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Dentist Specialist',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
                  Text('3'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  CallWidget(
                    text: '1',
                    onTap: () {
                      //
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CallWidget(
                    text: '2',
                    onTap: () {
                      //
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
