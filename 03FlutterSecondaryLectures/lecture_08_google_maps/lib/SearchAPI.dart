// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchApi extends StatefulWidget {
  const SearchApi({super.key});

  @override
  State<SearchApi> createState() => _SearchApiState();
}

class _SearchApiState extends State<SearchApi> {
  Map mapres = {};
  List listres = [];

  TextEditingController searchController = TextEditingController();

  getMyAPI(String searchValue) async {
    String searchInput = searchValue;

    String mapApi =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=geocode&key=API_KEY HERE";

    http.Response response = await http.get(Uri.parse(mapApi));

    print("Smasb=> " + response.body);

    if (response.statusCode == 200) {
      setState(() {
        mapres = jsonDecode(response.body);
        listres = mapres["predictions"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Places API")),
      body: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Enter Your Location",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              getMyAPI(value);
              setState(() {});
            },
          ),
          Expanded(
              child: ListView.builder(
            itemCount: listres.isEmpty ? 0 : listres.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.map),
                title: Text(listres[index]["description"].toString()),
              );
            },
          ))
        ],
      ),
    );
  }
}
