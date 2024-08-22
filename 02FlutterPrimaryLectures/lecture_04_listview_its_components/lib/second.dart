
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  var mycolor = [
    Colors.teal,
    Colors.teal[900],
    Colors.black,
    Colors.indigo[900],
    Colors.purple[900],
    Colors.blue
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            color: mycolor[index],
          );
        },
        itemCount: mycolor.length,
        itemExtent: 100,
      ),
    );
  }
}
