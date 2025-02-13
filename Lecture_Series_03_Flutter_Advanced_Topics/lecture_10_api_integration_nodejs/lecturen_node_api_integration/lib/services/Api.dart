import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  late List userdata = [];
  static const baseurl = "http://192.168.18.55:2000/api/";


//  post api

  static postuserapi(Map udata) async {
    try {
      var response =
          await http.post(Uri.parse("${baseurl}add_infouser"), body: udata);

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        print("WA 910=>${data.toString()}");
      } else {
        print("WA 910=> no response get ");
      }
    } catch (e) {
      print("smas=>" + e.toString());
    }
  }



    getuserapi() async {
    var response = await http.get(Uri.parse("${baseurl}get_infouser"));
    try {
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        userdata = data["userdata"];
        print("My get response WA910 =>${userdata.toString()} ");
      } else {
        print("API failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }


// update api
  updateuserapi(id, Map udata) async {
    var response = await http.post(Uri.parse("${baseurl}update_infouser/$id"),
        body: udata);
    try {
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        // userdata = data["userdata"];
        print("My update response WA910 =>${data.toString()} ");
      } else {
        print("API failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data:update $e");
    }
  }

// delete api
  deleteuserapi(id) async {
    var response = await http.post(Uri.parse("${baseurl}delete_infouser/$id"));
    try {
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        // userdata = data["userdata"];
        print("My delete response WA910 =>${data.toString()} ");
      } else {
        print("API failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: delete => $e");
    }
  }

















}