import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati_8_19/core/functions/navigation.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/core/widgets/custom_button.dart';
import 'package:taskati_8_19/feature/add_task/add_task_view.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: getTitleTextStyle(fontWeight: FontWeight.w700)),
              Text(
                'Today',
                style: getTitleTextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        CustomButton(
            width: 140,
            text: '+ Add Task',
            onPressed: () {
              push(context, const AddTaskView());
            })
      ],
    );
  }
}
