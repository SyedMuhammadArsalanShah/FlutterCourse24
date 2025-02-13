import 'package:flutter/material.dart';
import 'package:lecture_04_listview_its_components/third.dart';
import 'first.dart';
import 'second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => First(),
                      ));
                },
                child: Text("First | Static List View")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Second(),
                      ));
                },
                child: Text("Second | ListViewBuilder")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Third(),
                      ));
                },
                child: Text("Third | Seperated List View Builder")),
          ],
        ),
      ),
    );
  }
}
