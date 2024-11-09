import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("taskBox");

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List showall = [];

// create data

  var taskBox = Hive.box("taskBox");

  createData(Map<String, dynamic> row) async {
    await taskBox.add(row);
    readAll();
  }

  updateData(int? key, Map<String, dynamic> row) async {
    await taskBox.put(key, row);

    readAll();
  }

  readAll() async {
    var data = taskBox.keys.map(
      (e) {
        final items = taskBox.get(e);

        return {"key": e, "title": items["title"], "desc": items["desc"]};
      },
    ).toList();

    setState(() {
      showall = data.reversed.toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          meraModal(0);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: showall.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(showall[index]["title"]),
            subtitle: Text(showall[index]["desc"]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      var updatevalue = showall[index]["key"];
                      meraModal(updatevalue);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      var deleteValue = showall[index]["key"];
                      taskBox.delete(deleteValue);
                      readAll();
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }

  void meraModal(int id) {
    titleController.clear();
    descController.clear();

    if (id != 0) {
      final item = showall.firstWhere(
        (element) => element["key"] == id,
      );
      titleController.text = item["title"];
      descController.text = item["desc"];
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              32, 32, 32, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter Your Title"),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(hintText: "Enter Your description"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    String title = titleController.text.toString();
                    String desc = descController.text.toString();
                    var data = {"title": title, "desc": desc};
                    if (id == 0) {
                      createData(data);
                    } else {
                      // update

                      updateData(id, data);
                    }
                    Navigator.pop(context);
                  },
                  child: id == 0 ? Text("Add") : Text("update"))
            ],
          ),
        );
      },
    );
  }
}
