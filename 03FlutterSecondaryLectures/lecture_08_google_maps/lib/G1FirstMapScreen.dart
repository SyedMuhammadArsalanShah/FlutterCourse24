import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'L02Animate.dart';
import 'L03CurrentLocation.dart';

class FirstMapScreen extends StatefulWidget {
  const FirstMapScreen({super.key});

  @override
  State<FirstMapScreen> createState() => _FirstMapScreenState();
}

class _FirstMapScreenState extends State<FirstMapScreen> {
  Completer<GoogleMapController> completer = Completer();

  CameraPosition cameraPosition = CameraPosition(
      target: LatLng(24.882408312153768, 67.06721822424507), zoom: 14.45);

  List<Marker> markerspin = [];
  final List<Marker> markerslist = [
    Marker(
        markerId: MarkerId("wa910"),
        position: LatLng(24.882408312153768, 67.06721822424507),
        infoWindow: InfoWindow(title: "My  Fav Location ")),
    Marker(
        markerId: MarkerId("wa"),
        position: LatLng(24.879350042154694, 67.07132740805048),
        infoWindow: InfoWindow(title: "Masjid Location  "))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    markerspin.addAll(markerslist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Camera Animation and Current Location "),),
      
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // object pass
            L02Animate().animatecam(
                completer, const LatLng(40.89118582196477, 29.37841964251205));
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: GoogleMap(
                  
                  initialCameraPosition: cameraPosition,
                  mapType: MapType.normal,
                  markers: Set.of(markerslist),
                  onMapCreated: (GoogleMapController controller) {
                    completer.complete(controller);
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                  L03CurrentLocation().callLocation(markerslist,completer);

                  });
                },
                child: Text("Current Location")),

              SizedBox(height: 10,)
          ],
        ));
  }
}
