import 'package:hive/hive.dart';

part 'task_model.g.dart';
@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String date;
  @HiveField(4)
  String startTime;
  @HiveField(5)
  String endTime;
  @HiveField(6)
  int color;
  @HiveField(7)
  bool isCompleted;

  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.color,
      required this.isCompleted});
}
