import 'dart:async';
import 'SearchAPI.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchApi(),
    );
  }
}
class LectureOneMap extends StatefulWidget {
  const LectureOneMap({super.key});

  @override
  State<LectureOneMap> createState() => _LectureOneMapState();
}

class _LectureOneMapState extends State<LectureOneMap> {
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






