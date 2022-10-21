part of 'services.dart';

class NotificationService {
  //Variable
  late FlutterLocalNotificationsPlugin localNotif =
      FlutterLocalNotificationsPlugin();

  void init(
      Future<dynamic> Function(int, String?, String?, String?)? onDidReceive,
      Function(NotificationResponse)? onDidReceiveNotificationResponse) {
    late AndroidInitializationSettings androidSettings =
        const AndroidInitializationSettings(appIcon);

    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceive,
    );

    final InitializationSettings initSetting =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    tz.initializeTimeZones();
    initLocalNotif(initSetting, onDidReceiveNotificationResponse);
  }

  void initLocalNotif(InitializationSettings initSetting,
      Function(NotificationResponse)? onDidReceiveNotificationResponse) async {
    await localNotif.initialize(initSetting,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void showNotif(String title, String message, String idProduct) async {
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt',
            playSound: true);

    DarwinNotificationDetails iosNotifDetail =
        const DarwinNotificationDetails();

    await localNotif.show(12345, title, message,
        NotificationDetails(android: androidNotifDetail, iOS: iosNotifDetail),
        payload: idProduct);
  }

  void showNotifBirthday(String title, String message, String idProduct) async {
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt',
            playSound: true);

    DarwinNotificationDetails iosNotifDetail =
        const DarwinNotificationDetails();

    await localNotif.zonedSchedule(
        12345,
        title,
        message,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        NotificationDetails(android: androidNotifDetail, iOS: iosNotifDetail),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: idProduct);
  }
}
