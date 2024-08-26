import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_8_19/core/models/task_model.dart';
import 'package:taskati_8_19/core/services/local_storage.dart';
import 'package:taskati_8_19/core/utils/themes.dart';
import 'package:taskati_8_19/feature/intro/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('userBox');
  await Hive.openBox<TaskModel>('taskBox');
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppLocalStorage.userBox.listenable(),
        builder: (context, userBox, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: userBox.get(AppLocalStorage.kIsDarkMode)
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            home: const SplashView(),
          );
        });
  }
}
