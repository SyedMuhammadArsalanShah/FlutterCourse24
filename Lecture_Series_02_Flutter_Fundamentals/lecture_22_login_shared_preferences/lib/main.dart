import 'dart:async';

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
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load();
  }

  load() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isLogin = sharedPreferences.getBool("isLogin");

    Timer(Duration(seconds: 3), () {
      if (isLogin != null) {
        if (isLogin) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeSCR(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginSCR(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginSCR(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Achy Bachy"),
      ),
    );
  }
}

class LoginSCR extends StatefulWidget {
  const LoginSCR({super.key});

  @override
  State<LoginSCR> createState() => _LoginSCRState();
}

class _LoginSCRState extends State<LoginSCR> {
  @override
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
              onPressed: () async {
                String email = useremail.text.toString();
                String pass = userpass.text;

                print("My Email${email}");
                print("My Pass${pass}");

                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();

                sharedPreferences.setBool("isLogin", true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Second(),
                    ));
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}

class HomeSCR extends StatefulWidget {
  const HomeSCR({super.key});

  @override
  State<HomeSCR> createState() => _HomeSCRState();
}

class _HomeSCRState extends State<HomeSCR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();

              preferences.setBool("isLogin", false);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginSCR(),
                  ));
            },
            child: Text("Logout")),
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
  List listdata = [
    {"name": "Ali", "email": "a@gmail.com"},
    {"name": "Hamza", "email": "a@gmail.com"},
    {"name": "Usman", "email": "a@gmail.com"},
    {"name": "Usman", "email": "a@gmail.com"},
    {"name": "Saaria", "email": "a@gmail.com"},
    {"name": "Ebad", "email": "a@gmail.com"},
    {"name": "Hadi", "email": "a@gmail.com"},
    {"name": "Balach", "email": "a@gmail.com"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListWheelScrollView(
            itemExtent: 100,
            children: listdata.map(
              (value) {
                return Center(
                  child: ListTile(
                    tileColor: Colors.teal,
                    textColor: Colors.white,
                    title: Text(value["name"]),
                    subtitle: Text(value["email"]),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
