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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: useremail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.green,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                onPressed: () {
                  print("bhai info ");
                },
              ),
              hintText: "enter your email",
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.circular(14)),
              // disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey, width: 2), borderRadius:  BorderRadius.circular(14)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
          Container(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            obscureText: true,
            obscuringCharacter: "*",
            controller: userpass,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.green,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                onPressed: () {
                  print("bhai info ");
                },
              ),
              hintText: "enter your pass",
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.circular(14)),
              // disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey, width: 2), borderRadius:  BorderRadius.circular(14)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                String email = useremail.text.toString();
                String pass = userpass.text;

                print("My Email${email}");
                print("My Pass${pass}");
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
