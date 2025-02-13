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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Second(),
    );
  }
}


class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  var weightcontroller = TextEditingController();
  var feetcontroller = TextEditingController();
  var inchescontroller = TextEditingController();
  var result = "";
  var msg = "";
  var bgcolor = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI Calculator"),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: weightcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.monitor_weight_rounded)),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: feetcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(prefixIcon: Icon(Icons.height)),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: inchescontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(prefixIcon: Icon(Icons.height)),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var wt = weightcontroller.text.toString();
                      var ht =  feetcontroller.text.toString();
                      var it = inchescontroller.text.toString();
        
                      if (wt == "" && ht == "" && it == "") {
                        result = "please all fields";
                      } else {
                        var iwt = int.parse(wt);
                        var iht = int.parse(ht);
                        var iit = int.parse(it);
        
                        var totalinches = (iht * 12) + iit;
                        var totalcms = totalinches * 2.54;
        
                        var meter = totalcms / 100;
                        // kg / meter*meter
        
                        var bmi = iwt / (meter * meter);
        
                        if (bmi > 25) {
                          msg = "kam khaou";
                          bgcolor=Colors.red;
                        } else if (bmi < 18) {
                          msg = "zayada khaou";
                          
                          bgcolor=Colors.purple;
                        } else {
                          msg = "behtreen bandy ho app";
                          bgcolor=Colors.teal;
                        }
                        result = "$msg \n BMI is =${bmi.toStringAsFixed(2)}";
                      }
                    });
                  },
                  child: Text("Calculate BMI ")),
              SizedBox(
                height: 12,
              ),
              Text(
                "$result",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: bgcolor,
    );
  }
}
