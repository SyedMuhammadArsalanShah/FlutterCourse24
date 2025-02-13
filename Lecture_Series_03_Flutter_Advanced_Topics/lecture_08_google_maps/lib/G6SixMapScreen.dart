import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SixMapScreen extends StatefulWidget {
  const SixMapScreen({super.key});

  @override
  State<SixMapScreen> createState() => _SixMapScreenState();
}

class _SixMapScreenState extends State<SixMapScreen> {
  Completer<GoogleMapController> completer = Completer();
  CameraPosition cameraPosition = CameraPosition(
      target: LatLng(24.882408312153768, 67.06721822424507), zoom: 14.45);


String mapStyle="";
@override
  void initState() {
    // TODO: implement initState
    super.initState();

     DefaultAssetBundle.of(context).loadString("assets/maps/sliver.json").then((value){
          mapStyle=value;

     });







  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        // markers: Set.of(markerslist),
        onMapCreated: (GoogleMapController controller) {
          completer.complete(controller);
          controller.setMapStyle(mapStyle);
        },
      ),
    );
  }
}
