import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class L02Animate {
  void animatecam(
      Completer<GoogleMapController> completer, LatLng latLng) async {
    GoogleMapController googleMapController = await completer.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 14.5)));
  }
}
