import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EightMapScreen extends StatefulWidget {
  const EightMapScreen({super.key});

  @override
  State<EightMapScreen> createState() => _EightMapScreenState();
}

class _EightMapScreenState extends State<EightMapScreen> {
  final Set<Polyline> polyline = {};
  List<LatLng> points = [
    LatLng(24.882408312153768, 67.06721822424507),
    LatLng(24.879350042154694, 67.07132740805048),
  ];

  CameraPosition cameraPosition = const CameraPosition(
      target: LatLng(24.882408312153768, 67.06721822424507), zoom: 14.45);
  final List<Marker> markerslist = [
    const Marker(
        markerId: MarkerId("wa910"),
        position: LatLng(24.882408312153768, 67.06721822424507),
        infoWindow: InfoWindow(title: "My  Fav Location ")),
    const Marker(
        markerId: MarkerId("wa"),
        position: LatLng(24.879350042154694, 67.07132740805048),
        infoWindow: InfoWindow(title: "Masjid Location  "))
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    polyline.add(Polyline(polylineId: PolylineId("1"), points: points));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        polylines: polyline,
        markers: Set.of(markerslist),
      ),
    );
  }
}
