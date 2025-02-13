import 'package:flutter/material.dart';

import 'about.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        
        // RaisedButton → ElevatedButton  
        // FlatButton → TextButton  
        // OutlineButton → OutlinedButton 

          child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ));
              },
              child: Text("Next"))

          //  ElevatedButton(
          //     onLongPress: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => About(),
          //           ));
          //     },
          //     onPressed: () {print("onpress event");},
          //     child: Text("Next Screen")),
          ),
    );
  }
}
