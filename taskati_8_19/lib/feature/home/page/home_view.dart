import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_8_19/core/models/task_model.dart';
import 'package:taskati_8_19/core/services/local_storage.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/feature/home/widgets/home_header_widget.dart';
import 'package:taskati_8_19/feature/home/widgets/task_item_widget.dart';
import 'package:taskati_8_19/feature/home/widgets/today_header_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectDate = DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HomeHeaderWidget(),
              const Gap(20),
              const TodayHeaderWidget(),
              const Gap(20),
              DatePicker(
                DateTime.now().subtract(const Duration(days: 2)),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                dateTextStyle: getBodyTextStyle(context, fontSize: 18),
                monthTextStyle: getBodyTextStyle(context, fontSize: 14),
                dayTextStyle: getBodyTextStyle(context, fontSize: 14),
                onDateChange: (date) {
                  setState(() {
                    selectDate = DateFormat.yMd().format(date);
                  });
                },
              ),
              const Gap(20),
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: AppLocalStorage.taskBox.listenable(),
                builder: (context, taskBox, child) {
                  List<TaskModel> tasks = [];
                  taskBox.keys.forEach((key) {
                    if (selectDate ==
                        AppLocalStorage.getCachedTaskData(key)?.date) {
                      tasks.add(AppLocalStorage.getCachedTaskData(key)!);
                    }
                  });
                  return tasks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset('assets/empty.json'),
                              Text(
                                'No Tasks Found',
                                style: getBodyTextStyle(context,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          // shrinkWrap: true,
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                key: UniqueKey(),
                                background: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: AppColors.whiteColor,
                                      ),
                                      const Gap(10),
                                      Text(
                                        'Complete Task',
                                        style: getBodyTextStyle(context,
                                            color: AppColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                                secondaryBackground: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.delete,
                                        color: AppColors.whiteColor,
                                      ),
                                      const Gap(10),
                                      Text(
                                        'Delete Task',
                                        style: getBodyTextStyle(context,
                                            color: AppColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    // delete a task
                                    taskBox.delete(tasks[index].id);
                                  } else {
                                    // complete a task
                                    taskBox.put(
                                        tasks[index].id,
                                        TaskModel(
                                            id: tasks[index].id,
                                            title: tasks[index].title,
                                            description:
                                                tasks[index].description,
                                            date: tasks[index].date,
                                            startTime: tasks[index].startTime,
                                            endTime: tasks[index].endTime,
                                            color: 3,
                                            isCompleted: true));
                                  }
                                },
                                child: TaskItemWidget(
                                  model: tasks[index],
                                ));
                          },
                        );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
