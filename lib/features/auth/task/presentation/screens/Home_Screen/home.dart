import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:up_course2/core/app,strings.dart';
import 'package:up_course2/core/app.assets.dart';
import 'package:up_course2/core/app.colors.dart';
import 'package:up_course2/core/commont/commont.dart';
import 'package:up_course2/core/widgets/elev_button/elev_button.dart';
import 'package:up_course2/features/auth/task/presentation/screens/Add_Task/add_task_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigate(context: context, screen: AddTaskScreen());
          },
          backgroundColor: AppColors.primary,
          child: const Icon(CupertinoIcons.plus),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Today',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.backgroundOfDatePicker,
                selectedTextColor: AppColors.white,
                dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                height: 94,
                width: 59,
                onDateChange: (date) {},
              ),
              const SizedBox(
                height: 11,
              ),
              //noTask(),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 250,
                          color: AppColors.deepGry,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: ElevCustomButton(
                                    text: AppStrings.appTaskCompleted,
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: ElevCustomButton(
                                    text: AppStrings.appDeleteTask,
                                    backgroundColor: AppColors.red,
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: ElevCustomButton(
                                    text: AppStrings.appCancel,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const TaskWidget()),
              const TaskWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Center noTask() => Center(child: Image.asset(AppAssets.task));
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task 1',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.timer,
                        color: AppColors.white,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('09:33 PM - 09:48 PM',
                          style: Theme.of(context).textTheme.displayMedium),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Learn Dart',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ],
              ),
            ),
            Container(
              height: 75,
              width: 1,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text('TODO',
                  style: Theme.of(context).textTheme.displayMedium),
            ),
          ],
        ),
      ),
    );
  }
}