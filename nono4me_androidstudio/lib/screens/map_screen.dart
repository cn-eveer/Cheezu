import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'dart:async';
import 'package:event/event.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nono4me_androidstudio/screens/search_places_screen.dart';


class MapScreen extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MapScreen> {

  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyCNnT3fExXiDeRkiojMLWrKHYSGrgcqgdY";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng startLocation = LatLng(35.70591, 139.354015);
  LatLng endLocation = LatLng(35.7061, 139.3423);
  LatLng currLocation = LatLng(0, 0);
  Timer? checkLocationTimer;
  Timer? simulateMovementTimer;
  var tooFar = Event();
  var arrived = Event();
  bool leading = false;
  bool goingHome = false;

  double distance = 0.0;


  @override
  void initState() {

    checkLocationTimer = Timer.periodic(Duration(seconds: 2), (Timer t) => checkLocation());
    //simulateMovementTimer = Timer.periodic(Duration(seconds: 4), (Timer t) => simulateMovement());
    tooFar.subscribe((args) => askForDestination());
    arrived.subscribe((args) => switchLocations());
    super.initState();
  }

  updateCurrentUserLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    var pos = await Geolocator.getCurrentPosition();
    currLocation = LatLng(pos.latitude, pos.longitude);
    print(currLocation);
  }

  simulateMovement(){
    if(!goingHome) {
      //print("Going");
      currLocation = LatLng(currLocation.latitude+0.01, 139.7196163108637);
    }
    else{
      //print("Going back");
      currLocation = LatLng(currLocation.latitude-0.01, 139.7196163108637);
    }
  }

  switchLocations(){
    var a = startLocation;
    startLocation = endLocation;
    endLocation = a;
    print("Setting course back for home");
    leadToDestination();
  }

  askForDestination(){
    tooFar.unsubscribe((args) => askForDestination());
    tooFar.subscribe((args) => leadToDestination());
    markers.add(Marker( //add start location marker
      markerId: MarkerId(currLocation.toString()),
      position: currLocation, //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    markers.add(Marker( //add distination location marker
      markerId: MarkerId(endLocation.toString()),
      position: endLocation, //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    leadToDestination();
  }
  leadToDestination(){
    leading = true;
    print("leading to destination");
    getDirections(); //fetch direction polylines from Google API
  }

  checkLocation() async {
    //print("Checking too far");
    await updateCurrentUserLocation();
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
    //print(distanceToDestination);
    if (leading){
      print(distanceToDestination);
      if(distanceToDestination < 40) {
        print("You have arrived");
        goingHome=!goingHome;
        arrived.broadcast();
      }
      leadToDestination();
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
              )
            ]
        )
    );
  }
}