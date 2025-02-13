import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       body: Center(
//           child: Text(
//         "SMAS",
//         style: TextStyle(fontSize: 30,

//         // color: Colors.teal
//         color: Color(0xff4db6ac)
//         // color: Color(0xff4db6ac)

//         ),
//       )),
//     ));
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.indigo,
            child: Center(child: Text("Misbah", style: TextStyle(color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}
