import 'package:flutter/material.dart';
import 'package:lecture_05_sqflite_database/services/Db_helper.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateScr(),
                  ));
            },
            child: Text("Create")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadDBScr(),
                  ));
            },
            child: Text("Read")),
        ElevatedButton(
            onPressed: () {
              Db_helper.instance.updateRecord({
                Db_helper.dt_id: 2,
                Db_helper.dt_name: "SMAS",
              });
              // Navigator.push(context,MaterialPageRoute(builder: (context) => ,));
            },
            child: Text("Update")),
        ElevatedButton(
            onPressed: () {
              Db_helper.instance.deleteRecord(1);
              // Navigator.push(context,MaterialPageRoute(builder: (context) => ,));
            },
            child: Text("Delete")),
      ],
    ));
  }
}

class CreateScr extends StatefulWidget {
  const CreateScr({super.key});

  @override
  State<CreateScr> createState() => _CreateScrState();
}

class _CreateScrState extends State<CreateScr> {
  TextEditingController abController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: abController,
          ),
          ElevatedButton(
              onPressed: () async {
                String name = abController.text.toString();

                await Db_helper.instance
                    .insertRecord({Db_helper.dt_name: name});
                setState(() {});

                Navigator.of(context).pop();
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}

class ReadDBScr extends StatefulWidget {
  const ReadDBScr({super.key});

  @override
  State<ReadDBScr> createState() => _ReadDBScrState();
}

class _ReadDBScrState extends State<ReadDBScr> {
  List<Map<String, dynamic>> datalist = [];

  void alldata() async {
    var data = await Db_helper.instance.querydatabase();
    setState(() {
      datalist = data;
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
      body: ListView.builder(
        itemCount: datalist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(datalist[index]["name"]),
          );
        },
      ),
    );
  }
}
