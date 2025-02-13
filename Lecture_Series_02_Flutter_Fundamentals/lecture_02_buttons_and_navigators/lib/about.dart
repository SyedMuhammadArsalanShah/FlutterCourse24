import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: TextButton(onPressed: (){
        Navigator.pop(context);
      },child: Text("Back screen"),),
    ),);
  }
}