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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            // simple card
            Card(
              child: ListTile(
                title: Text("SMAS"),
              ),
            ),
            // color card
            Card(
              child: ListTile(
                title: Text(
                  "SMAS",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.green,
            ),
          
          // elevated card
          Card(
            child: ListTile(
              title: Text("SMAS"),
            ),
            elevation: 8,
          )
          ,
          // shadow card
          Card(
            child: ListTile(
              title: Text("SMAS"),
            ),
            elevation: 8,
            shadowColor: Colors.green,
          ),
          // shape 
          Card(
            child: ListTile(
              title: Text("SMAS"),
            ),
            elevation: 8,
            shadowColor: Colors.green,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
          )
        ,
        
          // margin
          Card(
            child: ListTile(
              //leading: Icon(Icons.music_note),
              title: Text("SMAS"),
            ),
            elevation: 8,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(20),
          )
          ,
        
        // height and width
          Container(
            height: 200,
            width: 200,
            child: Card(
              child: ListTile(
                title: Text("SMAS"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
            ),
          ),
        
        // rounded corners
        
          Card(
            child: ListTile(
              title: Text("SMAS"),
            ),
            elevation: 8,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(20),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), 
                borderSide: BorderSide(color: Colors.white)
            ),
          )
          
        
        
        
        ,
        // border and border color
          Card(
            child: ListTile(
              title: Text("SMAS"),
            ),
            elevation: 8,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(20),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)
            ),
          )
          ,
        
        
        
        
          // circular card
          Card(
            child: Container(
              height: 160,
              width: 160,
              child: Center(
                child: ListTile(
                  title: Text("SMAS"),
                ),
              ),
            ),
            elevation: 8,
            shadowColor: Colors.green,
            margin: EdgeInsets.all(20),
            shape: CircleBorder(side: BorderSide(width: 1, color: Colors.white),
            ),
          )
          ,
        
        
        
        
          
          
          ],
        ),
      ),
    );
  }
}
