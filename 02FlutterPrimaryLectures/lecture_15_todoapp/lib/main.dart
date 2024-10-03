import 'package:flutter/material.dart';

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
  List<dynamic> todos = [1, 2, 3];
  var output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal.shade900,
              child: Text("${index + 1}"),
            ),
            title: Text("${todos[index]}"),
            trailing: Container(
              width: 70,
              child: Row(children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                    child: Icon(Icons.delete)),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Bhai data update karen "),
                            content: TextField(
                              onChanged: (value) {
                                output = value;
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      todos.replaceRange(
                                          index, index + 1, {output});
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  child: Text("update"))
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(Icons.edit))
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Bhai data add karen "),
                content: TextField(
                  onChanged: (value) {
                    output = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todos.add(output);
                        });

                        Navigator.of(context).pop();
                      },
                      child: Text("Add"))
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}