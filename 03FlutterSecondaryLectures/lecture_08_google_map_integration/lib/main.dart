import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Firstlecture(),
    );
  }
}

class Firstlecture extends StatefulWidget {
  const Firstlecture({super.key});

  @override
  State<Firstlecture> createState() => _FirstlectureState();
}

class _FirstlectureState extends State<Firstlecture> {
  Completer<GoogleMapController> completer = Completer();
  CameraPosition cameraPosition = CameraPosition(
      target: LatLng(24.905377475646524, 67.07978435002043), zoom: 14.12);

  List<Marker> markersSpin = [];
  final List<Marker> markersList = [
    Marker(
        markerId: MarkerId("SMASB01"),
        position: LatLng(24.905416400049727, 67.07982726536397),
        infoWindow: InfoWindow(title: "This is My Center ")),
    Marker(
        markerId: MarkerId("SMASB02"),
        position: LatLng(24.90680035829093, 67.0833981757884),
        infoWindow: InfoWindow(title: "Fav Masjid  ")),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markersSpin.addAll(markersList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            AnimateLectureTwo().animateCam(
                completer, LatLng(24.905387206748475, 67.07990236721534));

            setState(() {});
          },
          child:  Icon(Icons.location_searching),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: cameraPosition,
          markers: Set.of(markersList),
          onMapCreated: (GoogleMapController controller) {
            completer.complete(controller);
          },
        ));
  }
}

class AnimateLectureTwo {
  void animateCam(
      Completer<GoogleMapController> completer, LatLng latlng) async {
    GoogleMapController mapController = await completer.future;

    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latlng, zoom: 14.5)));
  }
}
