import 'package:flutter/material.dart';
import 'package:lecture_08_google_maps/G1FirstMapScreen.dart';
import 'package:lecture_08_google_maps/G2SecondMapScreen.dart';
import 'package:lecture_08_google_maps/G3ThirdMapScreen.dart';
import 'package:lecture_08_google_maps/G4FourthMapScreen.dart';
import 'package:lecture_08_google_maps/G5FiveMapScreen.dart';
import 'package:lecture_08_google_maps/G6SixMapScreen.dart';
import 'package:lecture_08_google_maps/G7SevenMapScreen.dart';
import 'package:lecture_08_google_maps/G8EightMapScreen.dart';

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
      home: NavbarScreen(),
    );
  }
}

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Maps Lecture 🗺"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstMapScreen(),
          ));
    },
    child: Text("Google Map Camera | Lecture 1")),
ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondMapScreen(),
          ));
    },
    child: Text("Google Address Conversion | Lecture 2")),
ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThirdMapScreen(),
          ));
    },
    child: Text("Google Search API | Lecture 3")),
ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FourthMapScreen(),
          ));
    },
    child: Text("Google Map Icons | Lecture 4")),
ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FiveMapScreen(),
          ));
    },
    child: Text("Google Map Custom Info Window | Lecture 5")),
ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SixMapScreen(),
          ));
    },
    child: Text("Google Map Themes | Lecture 6")),
ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SevenMapScreen(),
          ));
    },
    child: Text("Google Map Polygons | Lecture 7")),
ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EightMapScreen(),
          ));
    },
    child: Text("Google Map Polylines | Lecture 8")),
          ],
        ),
      ),

      backgroundColor: Colors.black,
    );
  }
}
