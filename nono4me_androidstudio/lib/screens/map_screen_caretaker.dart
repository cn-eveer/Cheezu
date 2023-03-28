import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'dart:async';
import "package:nono4me_androidstudio/screens/map_screen.dart";
import 'package:nono4me_androidstudio/Utils/notifications_manager.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";

class CaretakerScreen extends StatefulWidget {
  //LatLng endLocation = LatLng(35.70613,139.3423);
  static LatLng endLocation = LatLng(0, 0);
  static LatLng currLocation = LatLng(0, 0);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CaretakerScreen> {
  GoogleMapController? googleMapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCNnT3fExXiDeRkiojMLWrKHYSGrgcqgdY";
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  static const CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(35.70591, 139.354015), zoom: 14.0);
  LatLng startLocation = LatLng(35.70591, 139.354015);
  PolylineResult resultToDestination = PolylineResult();
  //LatLng endLocation = LatLng(0, 0);

  Timer? checkLocationTimer;
  Timer? notificationTimer;
  bool tooFarFromHouse = false;
  bool leading = false;
  bool goingHome = false;
  double distance = 0.0;
  int movementCounter = 0;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  LatLng oldEndLocation = CaretakerScreen.endLocation;

  @override
  void initState() {
    checkLocationTimer = Timer.periodic(
        const Duration(seconds: 2), (Timer t) => checkLocation());
    //simulateMovementTimer = Timer.periodic(Duration(seconds: 4), (Timer t) => simulateMovement());

    NotificationsManager.initialize(flutterLocalNotificationsPlugin);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    super.initState();
  }

  checkLocation(){
    if(MapScreen.offPath){
      markers.add(Marker(
        //add distination location marker
        markerId: MarkerId(MapScreen.endLocation.toString()),
        position: MapScreen.endLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        //add distination location marker
        markerId: MarkerId(MapScreen.currLocation.toString()),
        position: MapScreen.currLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Current point ',
          snippet: 'Current position Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    }
  }


  sendNotification(title, body) {
    if (tooFarFromHouse && !leading) {
      NotificationsManager.showBigTextNotification(
          title: title, body: body, fln: flutterLocalNotificationsPlugin);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition(
                //innital position in map
                target: startLocation, //initial position
                zoom: 14.0, //initial zoom level
              ),
              markers: markers, //markers to show on map
              polylines: Set<Polyline>.of(polylines.values), //polylines
              mapType: MapType.normal, //map type
              onMapCreated: (controller) {
                //method called when map is created
                setState(() {
                  googleMapController = controller;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
