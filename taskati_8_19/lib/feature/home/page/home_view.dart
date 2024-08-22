import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    // _selectedValue = date;
                  });
                },
              ),
              const Gap(20),
              Expanded(
                  child: ListView.builder(
                itemCount: 5,
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
                              style:
                                  getBodyTextStyle(color: AppColors.whiteColor),
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
                              style:
                                  getBodyTextStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          //
                        } else {}
                      },
                      child: const TaskItemWidget());
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
