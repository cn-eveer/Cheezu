import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'dart:async';
import 'package:event/event.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyCNnT3fExXiDeRkiojMLWrKHYSGrgcqgdY";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng startLocation = LatLng(35, 139.71956051510892);
  LatLng endLocation = LatLng(39, 139.71956051510892);
  LatLng currLocation = LatLng(35, 139.71956051510892);
  Timer? timer;
  Timer? timer2;
  var tooFar = Event();
  var arrived = Event();
  bool leading = true;

  double distance = 0.0;


  @override
  void initState() {
    markers.add(Marker( //add start location marker
      markerId: MarkerId(currLocation.toString()),
      position: currLocation, //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => checkLocation());
    timer2 = Timer.periodic(Duration(seconds: 2), (Timer t) => simulateMovement());
    tooFar.subscribe((args) => askForDestination());
    arrived.subscribe((args) => switchLocations());
    super.initState();
  }

  simulateMovement(){
    currLocation = LatLng(currLocation.latitude+1, 139.71956051510892);
  }

  switchLocations(){
    var a = startLocation;
    startLocation = endLocation;
    endLocation = a;
  }

  askForDestination(){
    leadToDestination();
  }
  leadToDestination(){
    leading = true;
    markers.add(Marker( //add distination location marker
      markerId: MarkerId(endLocation.toString()),
      position: endLocation, //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    getDirections(); //fetch direction polylines from Google API
  }

  checkLocation() async {
    print("Checking too far");
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //   googleAPiKey,
    //   PointLatLng(startLocation.latitude, startLocation.longitude),
    //   PointLatLng(currLocation.latitude, currLocation.longitude),
    //   travelMode: TravelMode.walking,
    // );
    double distanceFromHouse = calculateDistance(
        startLocation.latitude,
        startLocation.longitude,
        currLocation.latitude,
        currLocation.longitude) * 1000;
    double distanceToDestination = calculateDistance(
        currLocation.latitude,
        currLocation.longitude,
        endLocation.latitude,
        endLocation.longitude) * 1000;
    print(distanceToDestination);
    if (distanceToDestination < 40 && leading){
        print("You have arrived");
        arrived.broadcast();
    }
    if(!leading){
      if (distanceFromHouse > 40){
        print("Oi where the fuck you going");
        tooFar.broadcast();
      }
      else {
        print("Still around house");
        leading = false;
      }
    }
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(currLocation.latitude, currLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
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
    PolylineId id = PolylineId("poly");
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
          title: Text("Calculate Distance in Google Map"),
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
                    mapController = controller;
                  });
                },
              ),

              Positioned(
                  bottom: 200,
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
              )
            ]
        )
    );
  }
}