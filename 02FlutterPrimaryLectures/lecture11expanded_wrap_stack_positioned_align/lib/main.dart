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
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
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
    return Scaffold(body: Wrap(
      
      direction: Axis.vertical,
      children: [
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
       ElevatedButton(onPressed: (){}, child: Text("Data")),
          

    ],),);
  }
}