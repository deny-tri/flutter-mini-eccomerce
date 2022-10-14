part of 'services.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin localNotif =
      FlutterLocalNotificationsPlugin();

  void init(
      Future<dynamic> Function(int, String?, String?, String?)? onDidReceive) {
    //Android notification
    late AndroidInitializationSettings androidSettings =
        const AndroidInitializationSettings(appIcon);
    //IOS notification
    final DarwinInitializationSettings iosSetting =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceive,
    );
    final InitializationSettings initSettings =
        InitializationSettings(android: androidSettings, iOS: iosSetting);
    initLocalNotif(initSettings);
  }

  void initLocalNotif(InitializationSettings initSetting) async {
    await localNotif.initialize(initSetting);
  }

  void showNotif(String message) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(channelId, 'Belajar Salt');
    await localNotif.show(12345, "Hallo", message,
        NotificationDetails(android: androidNotificationDetails));
  }
}
