import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Fourth(),
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
      body: Wrap(
        direction: Axis.vertical,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
          ElevatedButton(onPressed: () {}, child: Text("Data")),
        ],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: 400,
              height: 400,
              color: Colors.black,
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.red,
                )),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}






