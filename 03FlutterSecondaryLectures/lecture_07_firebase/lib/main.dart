import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lecture_07_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    final user = auth.currentUser;

    Timer(
      Duration(seconds: 3),
      () {
        if (user != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ));
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emaillogin = TextEditingController();
  TextEditingController passlogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: emaillogin,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: passlogin,
            decoration: InputDecoration(hintText: "Pass"),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                String emailL = emaillogin.text.toString();
                String passL = passlogin.text.toString();

                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailL, password: passL);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userName = TextEditingController();
  TextEditingController emailsignup = TextEditingController();
  TextEditingController passsignup = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: userName,
              decoration: InputDecoration(hintText: "Username"),
            ),
            TextField(
              controller: emailsignup,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: passsignup,
              decoration: InputDecoration(hintText: "Pass"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  String emailS = emailsignup.text.toString();
                  String passS = passsignup.text.toString();

                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailS,
                      password: passS,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref("students");

  final key = FirebaseAuth.instance.currentUser!.uid;

  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Realtime DB"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [

          TextField(controller: searchController,decoration:  InputDecoration(hintText: "Search by title"),),
        Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference.child(key),
              itemBuilder: (context, snapshot, animation, index) {
               if(searchController.text.isEmpty){
                return ListTile(
                  title: Text(snapshot.child("Title").value.toString()),
                  subtitle: Text(snapshot.child("Title").value.toString()),
                  trailing: PopupMenuButton(itemBuilder: (context) {
                 return   [
                  PopupMenuItem(child: ListTile(onTap: () {

                   final id = snapshot.child("Title").value.toString();

                    meraModal(int.parse(id));
                  },))




                      
                    ];
                  },),
                  );
               }



              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          meraModal(0);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void meraModal(int id) {
    titleController.clear();
    descController.clear();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              32, 32, 32, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter Your Title"),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(hintText: "Enter Your description"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    String title = titleController.text.toString();
                    String desc = descController.text.toString();
                    if (id == 0) {
                      // createData(data);
                      id++;
                      databaseReference.child(key).child("$id").set({
                        "ID": id,
                        "Title": title,
                        "Description": desc,
                        "DateOfPost": DateTime.now().toString()
                      }).then(
                        (value) {
                          print("Successfully created ");
                        },
                      ).onError(
                        (error, stackTrace) {
                          print("failed task ");
                        },
                      );
                    } else {
                      // update

                      databaseReference.child(key).child("$id").update({
                        "ID": id,
                        "Title": titleController.text,
                        "Description": descController.text,
                        "DateOfPost": DateTime.now().toString()
                      }).then(
                        (value) {
                          print("Successfully created ");
                        },
                      ).onError(
                        (error, stackTrace) {
                          print("failed task ");
                        },
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: id == 0 ? Text("Add") : Text("update"))
            ],
          ),
        );
      },
    );
  }
}
