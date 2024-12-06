import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lecture_07_firebase/ImageDB.dart';
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
                builder: (context) => ImageDB(),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                        builder: (context) => ImageDB(),
                      ));
                },
                child: Text("Login")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                },
                child: Text("SignUp"))
          ],
        ),
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

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: Text("Signup"))
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

  int id = 1;

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
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                label: Text("Search BY Title"), hintText: "Search Here ......"),
            onChanged: (String value) {
              setState(() {});
            },
          ),
        ),

        Expanded(
          child: StreamBuilder(
            stream: databaseReference.child(key).onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;
                List<dynamic> item = map.values.toList();
                return ListView.builder(
                  itemCount: snapshot.data!.snapshot.children.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(item[index]["Title"].toString()),
                      subtitle: Text(item[index]["Description"].toString()),
                    );
                  },
                );
              }
            },
          ),
        ) //   Expanded(
        //     child: FirebaseAnimatedList(
        //         query: databaseReference.child(key),
        //         itemBuilder: (context, snapshot, animation, index) {
        //           String title = snapshot.child("Title").value.toString();
        //           if (searchController.text.isEmpty) {
        //             return ListTile(
        //                 title: Text(snapshot.child("Title").value.toString()),
        //                 subtitle: Text(
        //                     snapshot.child("Description").value.toString()),
        //                 trailing: PopupMenuButton(
        //                   icon: Icon(Icons.menu_sharp),
        //                   itemBuilder: (context) {
        //                     return [
        //                       PopupMenuItem(
        //                           value: 1,
        //                           child: ListTile(
        //                             onTap: () {
        //                               final id =
        //                                   snapshot.child("Id").value.toString();
        //                               meraModal(int.parse(id));
        //                             },
        //                             leading: Icon(Icons.edit),
        //                             title: Text("Edit"),
        //                           )),
        //                       PopupMenuItem(
        //                           value: 2,
        //                           child: ListTile(
        //                             onTap: () {
        //                               final id =
        //                                   snapshot.child("Id").value.toString();

        //                               databaseReference
        //                                   .child(key)
        //                                   .child(id)
        //                                   .remove();
        //                             },
        //                             leading: Icon(Icons.delete),
        //                             title: Text("Delete"),
        //                           ))
        //                     ];
        //                   },
        //                 ));
        //           } else if (title.contains(searchController.text.toString())) {
        //             return ListTile(
        //                 title: Text(snapshot.child("Title").value.toString()),
        //                 subtitle: Text(
        //                     snapshot.child("Description").value.toString()),
        //                 trailing: PopupMenuButton(
        //                   icon: Icon(Icons.menu_sharp),
        //                   itemBuilder: (context) {
        //                     return [
        //                       PopupMenuItem(
        //                           value: 1,
        //                           child: ListTile(
        //                             onTap: () {
        //                               final id =
        //                                   snapshot.child("Id").value.toString();
        //                               meraModal(int.parse(id));
        //                             },
        //                             leading: Icon(Icons.edit),
        //                             title: Text("Edit"),
        //                           )),
        //                       PopupMenuItem(
        //                           value: 2,
        //                           child: ListTile(
        //                             onTap: () {
        //                               final id =
        //                                   snapshot.child("Id").value.toString();

        //                               databaseReference
        //                                   .child(key)
        //                                   .child(id)
        //                                   .remove();
        //                               Navigator.pop(context);
        //                             },
        //                             leading: Icon(Icons.delete),
        //                             title: Text("Delete"),
        //                           ))
        //                     ];
        //                   },
        //                 ));
        //           } else {
        //             return Container();
        //           }
        //         }),
        //   ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          meraModal(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void meraModal(var postid) async {
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
                  onPressed: () async {
                    String title = titleController.text.toString();
                    String desc = descController.text.toString();
                    if (postid == null) {
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

                      databaseReference.child(key).child("$postid").update({
                        "ID": postid,
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
                  child: postid == null ? Text("Add") : Text("update"))
            ],
          ),
        );
      },
    );
  }
}

class HomeFireStore extends StatefulWidget {
  const HomeFireStore({super.key});

  @override
  State<HomeFireStore> createState() => _HomeFireStoreState();
}

class _HomeFireStoreState extends State<HomeFireStore> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  final firestore = FirebaseFirestore.instance.collection("FinalUser");

  final key = FirebaseAuth.instance.currentUser!.uid;
  // wrap on ListViewbuilder
  final getalldata = FirebaseFirestore.instance
      .collection("FinalUser")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("myuserspost")
      .snapshots();

  int id = 1;

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
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getalldata,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.docs[index];
                      // for null checkcorrect condition exception
                      return ListTile(
                        title: Text(data["Title"].toString()),
                        subtitle: Text(data['Description'].toString()),
                        trailing: PopupMenuButton(
                          icon: Icon(Icons.menu_sharp),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                  value: 1,
                                  child: ListTile(
                                    onTap: () {
                                      /*
                                      edit  main bhi hum logon ne delete ki tarah id get ki db se  than showform model ko de di jis se hum model bottom sheet open karwarahy hain ab chalty hain show model form pr
            
                                      */
                                      final id = data['Id'].toString();
                                      meraModal(int.parse(id));
                                    },
                                    leading: Icon(Icons.edit),
                                    title: Text("Edit"),
                                  )),
                              PopupMenuItem(
                                  value: 2,
                                  child: ListTile(
                                    onTap: () {
                                      /*
                                       jesy humne search ke liye title
                                       ko liye tha na snapshot main se
                                        wesy hi hum ne id ko liya hai
                                       or phir yeh id hum ne child ko pass karwadi and agr hum uper
                                        wali lety(int id =0) to us se hamesha humari value zero hi rehti */
                                      final id = data['Id'].toString();
                                      // dref.child(key).child(id).remove();

                                      firestore
                                          .doc(key)
                                          .collection("myuserspost")
                                          .doc(id)
                                          .delete();

                                      Navigator.pop(context);
                                    },
                                    leading: Icon(Icons.delete),
                                    title: Text("Delete"),
                                  )),
                            ];
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          meraModal(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void meraModal(var postid) async {
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
                  onPressed: () async {
                    String title = titleController.text.toString();
                    String desc = descController.text.toString();
                    if (postid == null) {
                      // createData(data);

                      id++;

                      firestore
                          .doc(key)
                          .collection("myuserspost")
                          .doc("$id")
                          .set({
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
                      firestore
                          .doc(key)
                          .collection("myuserspost")
                          .doc("$postid")
                          .update({
                        "ID": postid,
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
                  child: id == null ? Text("Add") : Text("update"))
            ],
          ),
        );
      },
    );
  }
}

