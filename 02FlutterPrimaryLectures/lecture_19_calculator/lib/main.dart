import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';


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
      home: const Calculator(),
    );
  }
}



class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(text) {
    return ElevatedButton(
        onPressed: () {
          setState(() {


            // result = result+ text;
            result += text;
          });
        },
        child: Text(text));
  }

  clearbtn() {
    setState(() {
      result = " ";
    });
  }

  equalbtn() {
    Parser parser = Parser();

    Expression exp = parser.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            result,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [btn("1"), btn("2"), btn("3"), btn("*")]),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [btn("4"), btn("5"), btn("6"), btn("-")]),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [btn("7"), btn("8"), btn("9"), btn("/")]),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            btn("0"),
            ElevatedButton(onPressed: clearbtn, child: Text("C")),
            ElevatedButton(onPressed: equalbtn, child: Text("=")),
            btn("+")
          ]),
        ],
      ),
    );
  }
}