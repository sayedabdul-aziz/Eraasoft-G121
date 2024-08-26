import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_8_19/core/models/task_model.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.model,
  });
  final TaskModel model;

  //Color res =  (==0) ? P : ()? O:R;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
      decoration: BoxDecoration(
        color: model.color == 0
            ? AppColors.primaryColor
            : model.color == 1
                ? AppColors.orangeColor
                : model.color == 2
                    ? AppColors.redColor
                    : Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: getTitleTextStyle(context, color: Colors.white),
              ),
              const Gap(6),
              Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    color: Colors.white,
                    size: 18,
                  ),
                  const Gap(10),
                  Text(
                    '${model.startTime} - ${model.endTime}',
                    style: getSmallTextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              const Gap(6),
              Text(
                model.description,
                style: getBodyTextStyle(context, color: Colors.white),
              ),
            ],
          )),
          Container(
            height: 60,
            width: 1,
            color: Colors.white,
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(model.isCompleted ? 'COMPLETED' : 'TODO',
                style: getTitleTextStyle(context,
                    color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
