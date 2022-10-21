import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mini_eccommerce/src/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  runApp(const App());
}
