import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../constant/app_constant.dart';

class HandleNotification {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialaize() async {
    const InitializationSettings initializationSettingsAndroid =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _notificationPlugin.initialize(
      initializationSettingsAndroid,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  static Future<void> showNotification(String title, String body) async {
    if (Platform.isAndroid) {
      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        channelId,
        channelName,
        channelDescription: channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'tricker',
      );
      final NotificationDetails notificationDetailsAndroid =
          NotificationDetails(android: androidNotificationDetails);
      await _notificationPlugin.show(
        101,
        title,
        body,
        notificationDetailsAndroid,
      );
    }
  }
}
