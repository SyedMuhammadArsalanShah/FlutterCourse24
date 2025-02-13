import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Drawer Nav"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Image.network(
                    "https://marketplace.canva.com/EAENvp21inc/1/0/1600w/canva-simple-work-linkedin-banner-qt_TMRJF4m0.jpg")),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Second(),
                    ));
              },
              child: ListTile(
                title: Text("Share"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Third(),
                    ));
              },
              child: ListTile(
                title: Text("FAQ"),
              ),
            )
          ],
        ),
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
  RangeValues values = RangeValues(0, 50000);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
        body: Center(
      child: RangeSlider(
        values: values,
        labels: labels,
        divisions: 20,
        min: 0,
        max: 100000,
        activeColor: Colors.teal,
        inactiveColor: Colors.lightGreen,
        onChanged: (mynewvalue) {
          values = mynewvalue;
          setState(() {});
        },
      ),
    ));
  }
}

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {

  TextEditingController ftController = TextEditingController();

  String getres= "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
 
       reload();
 
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            child: Image.network(
              "https://marketplace.canva.com/EAENvp21inc/1/0/1600w/canva-simple-work-linkedin-banner-qt_TMRJF4m0.jpg",
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          TextField(
            controller: ftController,
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();

                String name = ftController.text.toString();
                sharedPreferences.setString("meraname", name);

                setState(() {});
              },
              child: Text("Save")),

                 

               Text("$getres")




        ],
      ),
    );
  }
  
  void reload() async {

       SharedPreferences preferences= await SharedPreferences.getInstance();
        

      String? getname =  preferences.getString("meraname");

         getres = getname?? "value name";

         setState(() {
           
         });






  }
}
