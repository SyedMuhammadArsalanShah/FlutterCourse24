
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("First")),
          Text("hiba"),
          ElevatedButton(onPressed: () {}, child: Text("Second")),
          ElevatedButton(onPressed: () {}, child: Text("Third")),
          ElevatedButton(onPressed: () {}, child: Text("Fourth")),
        ],
      ),
    );
  }
}
