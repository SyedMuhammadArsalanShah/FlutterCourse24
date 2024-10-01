import 'package:flutter/material.dart';
import 'package:lecture_13_theme_style/myui/text.dart';


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

        textTheme: TextTheme(
        displayLarge: TextStyle(color:  Colors.indigo[900], fontSize: 50),
        displayMedium: TextStyle(color:  Colors.indigo[900], fontSize: 20),
        bodyLarge: TextStyle(fontSize: 20),


        )
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
    return Scaffold(body: Column(


      children: [

       Text("data", style: Theme.of(context).textTheme.displayLarge,),
       Text("data", style: Theme.of(context).textTheme.displayMedium,),
       Text("data", style: Theme.of(context).textTheme.displayLarge,),
      //  specific styling addson
       Text("data", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.teal),),
       Text("data", style: mytext(),),
       Text("data", style: mytextparams(mycolor: const Color.fromRGBO(233, 30, 99, 1)),),
       Text("data", style: mytextparams(),),





      ],
    ));
  }
}