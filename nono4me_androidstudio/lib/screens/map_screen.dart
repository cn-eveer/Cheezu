import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'dart:async';
import 'package:event/event.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nono4me_androidstudio/screens/search_places_button.dart';
import 'package:nono4me_androidstudio/Utils/notifications_manager.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";


class MapScreen extends StatefulWidget{
  //LatLng endLocation = LatLng(35.70613,139.3423);
  static LatLng endLocation = LatLng(0, 0);
  static LatLng currLocation = LatLng(0, 0);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MapScreen> {

  GoogleMapController? googleMapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCNnT3fExXiDeRkiojMLWrKHYSGrgcqgdY";
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(35.70591, 139.354015), zoom: 14.0);
  LatLng startLocation = const LatLng(35.70591, 139.354015);
  //LatLng endLocation = LatLng(0, 0);

  Timer? checkLocationTimer;
  Timer? notificationTimer;
  var tooFarEvent = Event();
  var arrived = Event();
  bool tooFarFromHouse = false;
  bool leading = false;
  bool goingHome = false;
  double distance = 0.0;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  LatLng oldEndLocation = MapScreen.endLocation;


  @override
  void initState() {
    checkLocationTimer = Timer.periodic(const Duration(seconds: 2), (Timer t) => checkLocation());
    notificationTimer = Timer.periodic(const Duration(seconds: 10), (Timer t) => sendNotification("Out for a walk?", "Please specify where you're going"));
    //simulateMovementTimer = Timer.periodic(Duration(seconds: 4), (Timer t) => simulateMovement());

    NotificationsManager.initialize(flutterLocalNotificationsPlugin);
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    tooFarEvent.subscribe((args) => askForDestination());
    arrived.subscribe((args) => switchLocations());
    super.initState();
  }

  resetEverything(){
    markers = {};
    polylinePoints = PolylinePoints();
    tooFarFromHouse = false;
    leading=false;
    goingHome=false;
  }

  updateLocations() async {

    var pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    MapScreen.currLocation = LatLng(pos.latitude, pos.longitude);

    if (leading && oldEndLocation != MapScreen.endLocation){
      markers.add(Marker( //add distination location marker
        markerId: MarkerId(MapScreen.endLocation.toString()),
        position: MapScreen.endLocation, //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.remove(Marker( //add distination location marker
        markerId: MarkerId(oldEndLocation.toString()),
        position: oldEndLocation, //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      oldEndLocation = MapScreen.endLocation;
    }
  }

  switchLocations(){
    var a = startLocation;
    startLocation = MapScreen.endLocation;
    MapScreen.endLocation = a;
    print("Setting course back for home");
    leadToDestination();
  }

  askForDestination() async{
    print("asking for destination");
    markers.add(Marker( //add start location marker
      markerId: MarkerId(startLocation.toString()),
      position: startLocation, //position of marker
      infoWindow: const InfoWindow( //popup info
        title: 'Home ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    if (MapScreen.endLocation.latitude != 0 || MapScreen.endLocation.longitude != 0){
      tooFarEvent.unsubscribe((args) => askForDestination());
      markers.add(Marker( //add distination location marker
        markerId: MarkerId(MapScreen.endLocation.toString()),
        position: MapScreen.endLocation, //position of marker
        infoWindow: const InfoWindow( //popup info
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      tooFarEvent.subscribe((args) => leadToDestination());
      leadToDestination();
    }
    else{
      print("still no destination set");
    }
  }
  leadToDestination(){
    leading = true;
    print("leading to destination");
    getDirections(); //fetch direction polylines from Google API
  }

  checkLocation() async {
    //print("Checking too far");
    await updateLocations();
    double distanceFromHouse = calculateDistance(
        startLocation.latitude,
        startLocation.longitude,
        MapScreen.currLocation.latitude,
        MapScreen.currLocation.longitude) * 1000;
    double distanceToDestination = calculateDistance(
        MapScreen.currLocation.latitude,
        MapScreen.currLocation.longitude,
        MapScreen.endLocation.latitude,
        MapScreen.endLocation.longitude) * 1000;
    //print(distanceToDestination);
    if (leading){
      print(distanceToDestination);
      if(distanceToDestination < 40) {
        print("You have arrived");
        goingHome=!goingHome;
        arrived.broadcast();
        if(goingHome){
          leading=false;
        }
      }
      leadToDestination();
    }
    if(!leading){
      if (distanceFromHouse > 40){
        print("Oi where the fuck you going");
        tooFarEvent.broadcast();
        tooFarFromHouse = true;
      }
      else {
        print("Still around house");
        leading = false;
        tooFarFromHouse=false;
      }
    }
  }

  sendNotification(title, body){
    if(tooFarFromHouse && !leading){
      NotificationsManager.showBigTextNotification(title: title, body: body, fln: flutterLocalNotificationsPlugin);
    }
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(MapScreen.currLocation.latitude, MapScreen.currLocation.longitude),
      PointLatLng(MapScreen.endLocation.latitude, MapScreen.endLocation.longitude),
      travelMode: TravelMode.walking,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for(var i = 0; i < polylineCoordinates.length-1; i++){
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i+1].latitude,
          polylineCoordinates[i+1].longitude);
    }
    print(totalDistance);

    setState(() {
      distance = totalDistance;
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    var result = 12742 * asin(sqrt(a));
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Calculate Distance in Google Map"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Stack(
            children:[
              GoogleMap( //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                initialCameraPosition: CameraPosition( //innital position in map
                  target: startLocation, //initial position
                  zoom: 14.0, //initial zoom level
                ),
                markers: markers, //markers to show on map
                polylines: Set<Polyline>.of(polylines.values), //polylines
                mapType: MapType.normal, //map type
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    googleMapController = controller;
                  });
                },
              ),

              Positioned(
                  bottom: 100,
                  left: 50,
                  child: Container(
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text(distance>1 ? "Total Distance: " + distance.toStringAsFixed(2) + " KM":
                            "Total Distance: " + (distance*1000).toStringAsFixed(2) + " M",
                                style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold))
                        ),
                      )
                  )
              ),
              SearchPlacesScreen(
                controller: googleMapController,
              ),
            ]
        )
    );
  }
}