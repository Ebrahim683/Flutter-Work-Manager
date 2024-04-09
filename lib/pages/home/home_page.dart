import 'package:flutter/material.dart';
import 'package:flutter_work_manager/notification/handle_notification.dart';
import 'package:flutter_work_manager/main.dart';
import 'package:workmanager/workmanager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HandleNotification.initialaize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Work Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Workmanager().registerPeriodicTask(
                  'notification',
                  notificationTask,
                  frequency: const Duration(minutes: 15),
                );
              },
              child: const Text('Start background task'),
            ),
          ],
        ),
      ),
    );
  }
}
