import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_8_19/core/functions/navigation.dart';
import 'package:taskati_8_19/core/models/task_model.dart';
import 'package:taskati_8_19/core/services/local_storage.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/core/widgets/custom_button.dart';
import 'package:taskati_8_19/feature/home/page/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  int colorIndex = 0;
  String taskDate = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(hours: 1)));

  var titleController = TextEditingController();
  var noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            'Add Task',
            style: getTitleTextStyle(context, color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Title',
              style: getTitleTextStyle(context, fontSize: 14),
            ),
            const Gap(8),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Ex: Go to School',
              ),
            ),
            const Gap(10),
            Text(
              'Note',
              style: getTitleTextStyle(context, fontSize: 14),
            ),
            const Gap(8),
            TextFormField(
              controller: noteController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Ex: Go to School',
              ),
            ),
            const Gap(10),
            Text(
              'Date',
              style: getTitleTextStyle(context, fontSize: 14),
            ),
            const Gap(8),
            TextFormField(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2040))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      taskDate = DateFormat.yMd().format(value);
                    });
                  }
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                  hintText: taskDate,
                  hintStyle: getBodyTextStyle(
                    context,
                  ),
                  suffixIcon: const Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Start Time',
                    style: getTitleTextStyle(context, fontSize: 14),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Text(
                    'End Time',
                    style: getTitleTextStyle(context, fontSize: 14),
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            startTime = value.format(context);
                          });
                        }
                      });
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: startTime,
                        hintStyle: getBodyTextStyle(
                          context,
                        ),
                        suffixIcon: const Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.primaryColor,
                        )),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            endTime = value.format(context);
                          });
                        }
                      });
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: endTime,
                        hintStyle: getBodyTextStyle(
                          context,
                        ),
                        suffixIcon: const Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.primaryColor,
                        )),
                  ),
                ),
              ],
            ),
            const Gap(30),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: List.generate(3, (int index) {
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              colorIndex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: index == 0
                                ? AppColors.primaryColor
                                : index == 1
                                    ? AppColors.orangeColor
                                    : AppColors.redColor,
                            child: colorIndex == index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                CustomButton(
                    width: 150,
                    text: 'Create Task',
                    onPressed: () {
                      String id = '${titleController.text}-${DateTime.now()}';
                      AppLocalStorage.cacheTaskData(
                          id,
                          TaskModel(
                              id: id,
                              title: titleController.text,
                              description: noteController.text,
                              date: taskDate,
                              startTime: startTime,
                              endTime: endTime,
                              color: colorIndex,
                              isCompleted: false));
                      pushWithReplacement(context, const HomeView());
                    })
              ],
            )
          ]),
        ));
  }
}
