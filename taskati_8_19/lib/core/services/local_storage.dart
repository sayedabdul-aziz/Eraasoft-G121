import 'package:hive/hive.dart';
import 'package:taskati_8_19/core/models/task_model.dart';

class AppLocalStorage {
  static String kIsUpload = 'isUpload';
  static String kIsDarkMode = 'isDarkMode';
  static String kName = 'name';
  static String kImage = 'image';

  static late Box userBox;
  static late Box<TaskModel> taskBox;
  static init() {
    userBox = Hive.box('userBox');
    taskBox = Hive.box('taskBox');
  }

  static cacheData(String key, value) {
    userBox.put(key, value);
  }

  static getCachedData(String key) {
    return userBox.get(key);
  }

  static cacheTaskData(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getCachedTaskData(String key) {
    return taskBox.get(key);
  }
}
