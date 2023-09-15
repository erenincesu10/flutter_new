import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  Task({required this.taskName,required this.taskStatus});
  @HiveField(0)
  String taskName;

  @HiveField(1)
  String taskStatus;

}