import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SevenMapScreen extends StatefulWidget {
  const SevenMapScreen({super.key});

  @override
  State<SevenMapScreen> createState() => _SevenMapScreenState();
}

class _SevenMapScreenState extends State<SevenMapScreen> {
  Set<Polygon> _polygon = HashSet<Polygon>();
  List<LatLng> points = [
    LatLng(24.879350042154694, 67.07132740805048),
    LatLng(24.882408312153768, 67.06721822424507),
    LatLng(24.882408312153768, 67.06721822424508),
    LatLng(24.87672327820584, 67.06265575222646),
    
    LatLng(24.879350042154694, 67.07132740805048)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _polygon.add(Polygon(
        polygonId: PolygonId("1"),
        points: points,
        fillColor: Colors.blue,
        geodesic: true,
        strokeWidth: 2,
        strokeColor: Colors.indigo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(24.882408312153768, 67.06721822424507), zoom: 14.45),
        // markers: Set.of(markerslist),
      
      polygons: _polygon,
      
      ),
    );
  }
}
