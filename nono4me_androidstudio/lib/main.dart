import 'package:flutter/material.dart';
import 'package:nono4me_androidstudio/screens/map_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(const MyApp());
}

const fetchBackground = "fetchBackground";
const testTask = "testTask";

@pragma(
    'vm:entry-point')
void callbackDispatcher() {
Workmanager().executeTask((task, inputData) async {
    switch (task) {
        case fetchBackground:
            print("Yeee haw");
            Position userLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
            MapScreen.currLocation=LatLng(userLocation.latitude, userLocation.longitude);
            print(MapScreen.currLocation );
            print("Yeee haw");
        break;
        case testTask:
            print("wooo it works!!!");
        break;
    }
    return Future.value(true);
    });
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );

    Workmanager().registerPeriodicTask(
      fetchBackground,
      fetchBackground,
    );
    Workmanager().registerOneOffTask(testTask, testTask);
    print("workmanager set up supposedly");

    Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });

    print("geolocator set up supposedly");
    return MaterialApp(
      title: 'Flutter Google Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),

    );
  }
}