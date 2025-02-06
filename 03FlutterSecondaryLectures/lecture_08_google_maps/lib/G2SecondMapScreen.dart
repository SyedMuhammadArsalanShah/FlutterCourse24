import 'package:flutter/material.dart';
// import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';

class SecondMapScreen extends StatefulWidget {
  const SecondMapScreen({super.key});

  @override
  State<SecondMapScreen> createState() => _SecondMapScreenState();
}

class _SecondMapScreenState extends State<SecondMapScreen> {
  var res = 'null';
  var res1 = 'null';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  // // From a query
                  //             final query = "1600 Amphiteatre Parkway, Mountain View";
                  //             var addresses =
                  //                 await Geocoder.local.findAddressesFromQuery(query);
                  //             var first = addresses.first;
                  //             print("add query${first.featureName} : ${first.coordinates}");

                  // // From coordinates
                  //             final coordinates = new Coordinates(1.10, 45.50);
                  //            var  addressescod = await Geocoder.local
                  //                 .findAddressesFromCoordinates(coordinates);
                  //             var second = addressescod.first;
                  //             print("add cod${second.featureName} : ${second.addressLine}");
                  List<Location> locations = await locationFromAddress(
                      "Alamgir Rd, Delhi Mercantile Society, Karachi, Karachi City, Sindh, Pakistan");

                  List<Placemark> placemarks = await placemarkFromCoordinates(
                      24.879413329710978, 67.07131668465915);

                  setState(() {
                    res = locations.first.latitude.toString() +
                        "," +
                        locations.last.longitude.toString();
                    res1 = placemarks.first.street.toString() +
                        " \n" +
                        placemarks.reversed.last.locality.toString() +
                        "," +
                        placemarks.reversed.last.country.toString();
                  });
                },
                child: Text("Convert Address to latlong")),
            Text("locationFromAddress  =>" + res),
            Text("placemarkFromCoordinates " + res1),
          ],
        ),
      ),
    );
  }
}
