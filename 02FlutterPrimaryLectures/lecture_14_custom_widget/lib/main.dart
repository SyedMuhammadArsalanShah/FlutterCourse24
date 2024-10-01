import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: const Second(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          mylisttile("Balach", "Ios"),
          mylisttile("Sana", "Dl"),
          mylisttile("Hadi", "AI"),
          mylisttile("Hiba", "Ml"),
          mylisttile("Saaria", "DA"),
          mylisttile("Ebad Cheetah", "Flutter Developer"),
        ],
      ),
    );
  }
}

Widget mylisttile(var mytitle, var mysubtitle) {
  return ListTile(
    title: Text(mytitle),
    subtitle: Text(mysubtitle),
    leading: CircleAvatar(
      backgroundColor: Colors.indigo[900],
      radius: 20,
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("8:17"),
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.indigo[900],
          child: Text(
            "78",
            style: TextStyle(fontSize: 11, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         listViewhorizontal(),
         listViewvertical(),
      listViewhorizontal(),
        ],
      ),
    );
  }
}

Widget listViewvertical() {
  return Expanded(
      flex: 7,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
         width: double.infinity,
         height: 100,
          color: Colors.indigo[900],
          child: Center(child: Text(quran.getSurahName(index + 1),style: TextStyle(color: Colors.white),)),
        ),
      );
        },
        itemCount: quran.totalSurahCount,
      ));
}

Widget listViewhorizontal() {
  return Expanded(
      child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
         width: 100,
         height: 100,
          color: Colors.teal[900],
          child: Center(child: Text(quran.getSurahName(index + 1),style: TextStyle(color: Colors.white),)),
        ),
      );
    },
    itemCount: quran.totalSurahCount,
  ));
}
