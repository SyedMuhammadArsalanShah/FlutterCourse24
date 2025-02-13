import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FourthMapScreen extends StatefulWidget {
  const FourthMapScreen({super.key});

  @override
  State<FourthMapScreen> createState() => _FourthMapScreenState();
}

class _FourthMapScreenState extends State<FourthMapScreen> {
  BitmapDescriptor markersicon = BitmapDescriptor.defaultMarker;
  List<Marker> markerslist = [];

  Future getmymarkericon(String image) async {
    await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), image)
        .then((value) {
      setState(() {
        markersicon = value;
      });
    }).onError((error, stackTrace) {
      print("SMAS => $markersicon");
    });
  }

  getImageicon() async {
    // to call getmymarkersicon() because  otherwise  markers icon pass default value because its future task so is waja se await karwaien gy
    await getmymarkericon("assets/images/i2.png");
    markerslist.addAll([
      Marker(
          markerId: MarkerId("wa910"),
          icon: markersicon,
          position: const LatLng(24.882408312153768, 67.06721822424507),
          infoWindow: InfoWindow(title: "My  Fav Location ")),
      Marker(
          icon: markersicon,
          markerId: MarkerId("wa"),
          position: LatLng(24.879350042154694, 67.07132740805048),
          infoWindow: InfoWindow(title: "Masjid Location  "))
    ]);
  }

  @override
  void initState() {
    // TODO: implement initState

    // to get complete markers list
    getImageicon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(24.882408312153768, 67.06721822424507), zoom: 14.45),
        markers: Set.of(markerslist),

        // another markers
        // markers: {
        //   Marker(
        //       markerId: const MarkerId("Smas"),
        //       icon: markersicon,
        //       position: LatLng(24.882408312153768, 67.06721822424507),
        //       infoWindow: InfoWindow(title: "My  Fav Location ")),
        // },
      ),
    );
  }
}
