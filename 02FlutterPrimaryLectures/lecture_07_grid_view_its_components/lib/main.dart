import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Third(),
      ),
    );
  }
}

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {


    var clrs = [
    Colors.teal,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.pink,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            // for count
            // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            // for size
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
        itemBuilder: (context, index) {
          return Container(color: clrs[index]);
        },
        itemCount: clrs.length,
      ),
    );
  }
}


class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
    var clrs = [
    Colors.teal,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.pink,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:GridView.count(crossAxisCount:3 ,
    mainAxisSpacing: 11,crossAxisSpacing: 11,
    children: [
                Container(color:clrs[0] ,),
                Container(color:clrs[1] ,),
                Container(color:clrs[2] ,),
                Container(color:clrs[3] ,),
                Container(color:clrs[4] ,),
                Container(color:clrs[5] ,),
       
    ],
    
    
    
    
    ) ,);

  }
}



class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {

    var clrs = [
    Colors.teal,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.pink,
    Colors.red
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:GridView.extent(maxCrossAxisExtent: 100,
    children: [

        Container(color:clrs[0] ,),
                Container(color:clrs[1] ,),
                Container(color:clrs[2] ,),
                Container(color:clrs[3] ,),
                Container(color:clrs[4] ,),
                Container(color:clrs[5] ,),
    ],
    
    
    ) ,);
  }
}