import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("GLS2 | Chat App"),
          ),
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Status")),
              Tab(child: Text("Chats")),
              Tab(child: Text("Reports"))
            ],
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.greenAccent,
          ),
        ),
        body: TabBarView(children: [Status(), Chats(), Reports()]),
      ),
    );
  }
}

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Reports")));
  }
}

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Status")));
  }
}

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          // color:  Colors.teal,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                 begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                Color(0xff010D26),
                Color(0xff023E73),
              ]),
              // color: Colors.indigo,

              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(21),
              //     bottomRight: Radius.circular(21))

              // borderRadius: BorderRadius.circular(21)
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              boxShadow: [
                BoxShadow(blurRadius: 21, color: Colors.grey, spreadRadius: 10)
              ],
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}
