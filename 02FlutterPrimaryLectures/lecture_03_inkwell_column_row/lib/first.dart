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
      body: Center(
        child: SingleChildScrollView(
         
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Yousuf"),
              Text("Muneeb"),
              Text("Hamza"),
              Text("Ebad"),
              Text("Annum"),
              Text("Sana"),
              Text("Misbah"),
              Text("hiba"),
              ElevatedButton(onPressed: () {}, child: Text("Next")),
              ElevatedButton(onPressed: () {}, child: Text("Next")),
              ElevatedButton(onPressed: () {}, child: Text("Next")),
              ElevatedButton(onPressed: () {}, child: Text("Next")),
              ElevatedButton(onPressed: () {}, child: Text("Next")),
              ElevatedButton(onPressed: () {}, child: Text("Next")),
              ElevatedButton(onPressed: () {}, child: Text("NextScreen")),
            ],
          ),
        ),
      ),
    );
  }
}
