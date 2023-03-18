import 'package:flutter/material.dart';
import 'package:nono4me_androidstudio/screens/map_screen.dart';
import 'package:nono4me_androidstudio/garbage/profileview.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:nono4me_androidstudio/Utils/notifications_manager.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),

    );
  }
}

