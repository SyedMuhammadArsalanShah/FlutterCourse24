import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdMapScreen extends StatefulWidget {
  const ThirdMapScreen({super.key});

  @override
  State<ThirdMapScreen> createState() => _ThirdMapScreenState();
}

class _ThirdMapScreenState extends State<ThirdMapScreen> {
  TextEditingController searchController = TextEditingController();

   String response="";
   Map response_map={};
   List response_list = [];

  Future getapi(String searchvalue) async {

    String searchInput=searchvalue;

    print("search value smas=>"+searchInput);
    String request="https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=geocode&key=YourKeyHere";
   http.Response response = await http.get(Uri.parse(request));

    print("api data =>" + response.body);
    if (response.statusCode == 200) {
      setState(() {
        response_map = jsonDecode(response.body);
        response_list = response_map["predictions"];
      });
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getapi(searchController.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Places API"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
               
         
                decoration: InputDecoration(hintText: "Search By Here .....",border:OutlineInputBorder() ),
                 onChanged: (value) {
          
                  getapi(value);
                  print("search value smas=>"+value);
          
                  setState(() {});
                },
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: response_list.isEmpty ? 0 : response_list.length,
                itemBuilder: (context, index) {
                  var data= response_list[index];
                  return ListTile(
                    leading: Icon(Icons.map),
                    title: Text(data["description"]),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}