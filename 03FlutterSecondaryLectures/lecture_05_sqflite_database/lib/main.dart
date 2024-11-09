import 'package:flutter/material.dart';
import 'package:lecture_05_sqflite_database/services/Db_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController achybachy = TextEditingController();

  List<Map<String, dynamic>> data = [];
  alldata() async {
    List<Map<String, dynamic>> datalist =
        await Db_helper.instance.querydatabase();
    setState(() {
    data = datalist;      
    });


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    alldata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          achybachy.clear();
          meraWidget(0);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["name"]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      achybachy.text = data[index]["name"];
                      meraWidget(data[index]["id"]);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      Db_helper.instance.deleteRecord(data[index]["id"]);
                      alldata();
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }

  void meraWidget(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: id == 0 ? Text("Add Record") : Text("Update Record"),
          content: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: achybachy,
              decoration: InputDecoration(hintText: "Enter Your Name "),
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (id == 0) {
                    String name = achybachy.text.toString();
                    Db_helper.instance.insertRecord({Db_helper.dt_name: name});
                  } else {
                    String name = achybachy.text.toString();
                    Db_helper.instance.updateRecord(
                        {Db_helper.dt_name: name, Db_helper.dt_id: id});
                  }
                alldata();
                  achybachy.clear();
                  Navigator.of(context).pop();
                },
                child: id == 0 ? Text("Add") : Text("Update"))
          ],
        );
      },
    );
  }
}
