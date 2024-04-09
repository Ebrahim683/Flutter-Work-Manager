import 'package:flutter/material.dart';
import 'package:flutter_work_manager/notification/handle_notification.dart';
import 'package:flutter_work_manager/pages/home/home_page.dart';
import 'package:workmanager/workmanager.dart';

// todo: update jdk7 to jdk8 in the workmanager package build file

const String notificationTask = 'notificationTask';
callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    switch (taskName) {
      case notificationTask:
        print('notification task running');
        HandleNotification.showNotification(
            'notification title', 'Notification is running');
        break;
      default:
    }
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
