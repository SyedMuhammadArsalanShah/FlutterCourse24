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
        // try changing the seedColor in the colorScheme below to Colors.greevalues: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Second(),
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
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 10, minHeight: 10, maxHeight: 500, maxWidth: 300),
            child: Column(children: [
              Text(
                  "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Rerum officia quam modi ullam, incidunt omnis, dignissimos minima unde laudantium, reprehenderit rem pariatur eius expedita ea maxime? Facere sapiente dolor distinctio."),
              ElevatedButton(onPressed: () {}, child: Text("Yousuf")),
              ElevatedButton(onPressed: () {}, child: Text("Yousuf")),
            ]),
          )
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
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 10, minHeight: 10, maxWidth: 200, maxHeight: 80),
            child: SizedBox.expand(
              child: ElevatedButton(onPressed: () {}, child: Text("Hello")),
            ),
          ),
                  ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 10, minHeight: 10, maxWidth: 200, maxHeight: 80),
            child: SizedBox.shrink(
              child: ElevatedButton(onPressed: () {}, child: Text("Hello")),
            ),
          ),
          SizedBox(height: 100,), 
                   ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 10, minHeight: 10, maxWidth: 200, maxHeight: 80),
            child: SizedBox.square(
              child: ElevatedButton(onPressed: () {}, child: Text("Hello")),
            ),
          ),
        ],
      ),
    );
  }
}
