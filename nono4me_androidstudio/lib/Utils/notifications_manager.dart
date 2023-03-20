import "package:flutter_local_notifications/flutter_local_notifications.dart";

class NotificationsManager{
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('@drawable/ic_stat_add_location_alt');
    var initializationsSettings = InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings );
  }

  static showBigTextNotification({var id =0,required String title, required String body,
    var payload, required FlutterLocalNotificationsPlugin fln
  } ) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const AndroidNotificationDetails('too_far_channel', 'too_far_channel',
        channelDescription: 'too far!',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');


    var notificationDetails= NotificationDetails(android: androidPlatformChannelSpecifics);
    print("Sending notification "+ title);
    fln.show(1, title, body, notificationDetails, payload: "Hi");
  }
}