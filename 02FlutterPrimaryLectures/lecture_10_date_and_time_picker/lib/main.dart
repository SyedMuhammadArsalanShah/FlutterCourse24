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
      home: const Home(),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () async {
//                 DateTime? datepicker = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2001),
//                     lastDate: DateTime(2026));

//                 if (datepicker != null) {
//                   print("Selected ${datepicker.day}");
//                 }
//               },
//               child: const Text("Date Picker")),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 TimeOfDay? timepicker = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.now(),
//                     initialEntryMode: TimePickerEntryMode.dial);


//                   if (timepicker != null) {
//                     print( timepicker.hour);
//                   }
//               },
//               child: Text("Time Picker")),
//         ],
//       ),
//     );
//   }
// }



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




