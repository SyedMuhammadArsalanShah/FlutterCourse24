import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        // Main Axis: The direction in which the children are laid out. For a Column, this is the vertical axis, and for a Row, it's the horizontal axis.
        mainAxisAlignment: MainAxisAlignment.center,
        // Cross Axis: The direction perpendicular to the main axis. For a Column, this is the horizontal axis, and for a Row, it's the vertical axis.
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text("Yousuf"),
          Text("Muneeb"),
          Text("Hamza"),
          Text("Ebad"),
          Text("Annum"),
          Text("Sana"),
          Text("Misbah"),
          Text("hiba"),
          ElevatedButton(onPressed: () {}, child: Text("next")),
          ElevatedButton(onPressed: () {}, child: Text("next")),
          ElevatedButton(onPressed: () {}, child: Text("next")),
          ElevatedButton(onPressed: () {}, child: Text("next")),
        ],
      ),
    );
  }
}
