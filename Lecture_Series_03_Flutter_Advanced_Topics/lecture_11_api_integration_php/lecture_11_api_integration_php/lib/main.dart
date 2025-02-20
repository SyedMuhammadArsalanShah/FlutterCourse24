import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
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
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


Future<void> registerUser()async{


final url =Uri.parse("http://192.168.18.55/flutter_api/register.php");

var response= await http.post(url,body: {
  'name':nameController.text,
  'email':emailController.text,
  'password':passController.text,

});

var data= json.decode(response.body);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(label: Text("Name")),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(label: Text("Email")),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(label: Text("Pass")),
          ),
          ElevatedButton(onPressed:registerUser , child: Text("Submit"))
        ],
      ),
    );
  }
}
