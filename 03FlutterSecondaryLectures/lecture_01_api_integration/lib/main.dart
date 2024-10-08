import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ApilecThree(),
    );
  }
}

class APILecOne extends StatefulWidget {
  const APILecOne({super.key});

  @override
  State<APILecOne> createState() => _APILecOneState();
}

class _APILecOneState extends State<APILecOne> {
  getinfo() async {
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
    var jsonData = jsonDecode(response.body);

    print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                ElevatedButton(onPressed: getinfo, child: Text("Get Data "))));
  }
}

class APILecTwo extends StatefulWidget {
  const APILecTwo({super.key});

  @override
  State<APILecTwo> createState() => _APILecTwoState();
}

class _APILecTwoState extends State<APILecTwo> {
  getinfo() async {
    var users = [];
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
    var jsonData = jsonDecode(response.body);

    print(jsonData);

    for (var i in jsonData) {
      ModelData user = ModelData(i["name"], i["email"], i["address"]["city"]);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getinfo(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].name.toString()),
                  subtitle: Row(
                    children: [
                      Text(snapshot.data[index].email.toString()),
                      Text(snapshot.data[index].address.toString()),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// late String responsedata;
late Map mapresp;
late List listresp;

class ApilecThree extends StatefulWidget {
  const ApilecThree({super.key});

  @override
  State<ApilecThree> createState() => _ApilecThreeState();
}

class _ApilecThreeState extends State<ApilecThree> {
  Future apicallkardo() async {
    http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp = jsonDecode(response.body);
        listresp = mapresp["data"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    apicallkardo();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Text(responsedata.toString()),);
    return Scaffold(
      body: ListView.builder(
        itemCount: listresp.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listresp[index]["first_name"].toString()),
            subtitle: Text(listresp[index]["email"].toString()),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listresp[index]["avatar"]),
            ),
          );
        },
      ),
    );
  }
}

class ModelData {
  var name;
  var email;
  var address;
  ModelData(this.name, this.email, this.address);
}
