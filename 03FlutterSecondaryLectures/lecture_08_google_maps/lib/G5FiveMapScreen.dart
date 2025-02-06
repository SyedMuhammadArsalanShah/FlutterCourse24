import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FiveMapScreen extends StatefulWidget {
  const FiveMapScreen({super.key});

  @override
  State<FiveMapScreen> createState() => _FiveMapScreenState();
}

class _FiveMapScreenState extends State<FiveMapScreen> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final LatLng _latLng = LatLng(24.882408312153768, 67.06721822424507);
  final double _zoom = 15.0;

  List<Marker> markers = [];

  Widget mywidgetforinfowindow() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.circular(4),
            ),
            width: double.infinity,
            height: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "This My Location info ",style: TextStyle(color: Colors.white,),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }






  getmyinfomarker() {
    markers.add(
      Marker(
          onTap: () {
            _customInfoWindowController.addInfoWindow!(mywidgetforinfowindow(),_latLng);
          },
          markerId: const MarkerId("wa910"),
          position: const LatLng(24.882408312153768, 67.06721822424507),
          infoWindow: const InfoWindow(title: "My Fav Location ")),
    );
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyinfomarker();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
            markers: Set.of(markers),
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 100,
            width: 200,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
