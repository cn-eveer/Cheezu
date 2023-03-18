import "package:flutter_local_notifications/flutter_local_notifications.dart";



class NotificationsManager{
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInitialize = const IOSInitializationSettings();
    var initializationsSettings = InitializationSettings(android: androidInitialize,
        iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings );
  }

  static Future showBigTextNotification({var id =0,required String title, required String body,
    var payload, required FlutterLocalNotificationsPlugin fln
  } ) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const AndroidNotificationDetails(
      'too_far_channel',
      'too_far_channel',
      "channel for telling user when he's too far",
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );

    var not= NotificationDetails(android: androidPlatformChannelSpecifics,
        iOS: IOSNotificationDetails()
    );
    await fln.show(0, title, body,not );
  }
}
