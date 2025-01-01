import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lecture_07_firebase/Toastmsg.dart';
import 'package:lecture_07_firebase/main.dart';

class ImageDB extends StatefulWidget {
  const ImageDB({super.key});

  @override
  State<ImageDB> createState() => _ImageDBState();
}

class _ImageDBState extends State<ImageDB> {
  File? image;
  final imagePicker = ImagePicker();

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref("meri_Images");
  final storageref = FirebaseStorage.instance.ref("imagesFolder");
  final key = FirebaseAuth.instance.currentUser!.uid;
  var id = 1;
  Future getImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print("no image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              image == null ? Text("No image") : Image.file(image!.absolute),
              ElevatedButton(
                  onPressed: () {
                    getImageFromGallery();
                  },
                  child: Text("Image Select")),
              ElevatedButton(
                  onPressed: () async {
                    id++;

                    final refimage =
                        await storageref.child("img").child("$key/$id");

                    UploadTask uploadTask = refimage.putFile(image!.absolute,
                        SettableMetadata(contentType: "image/jpeg"));

                    Future.value(uploadTask).then(
                      (value) async {
                        final downloadurl = await refimage.getDownloadURL();

                        print("SMAS=>" + downloadurl);

                        databaseReference.child(key).child("$id").set({
                          "ID": id,
                          "imageUrl": downloadurl,
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
                      },
                    );
                  },
                  child: Text("Image Upload")),
            ],
          ),
        ),
      ),
    );
  }
}

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text("Enter Your phone number")),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneController.text.toString(),
                      verificationCompleted: (_) {},
                      verificationFailed: (error) {
                        Toastmsg().toast(error.toString());
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpSCR(verificationId: verificationId),
                            ));
                      },
                      codeAutoRetrievalTimeout: (error) {
                        Toastmsg().toast(error.toString());
                      });
                },
                child: Text("Phone"))
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OtpSCR extends StatefulWidget {
  String verificationId;

  // Otp(this.verificationId, {super.key});

  OtpSCR({Key?key ,required this.verificationId }):super(key: key);

  @override
  State<OtpSCR> createState() => _OtpSCRState();
}

class _OtpSCRState extends State<OtpSCR> {
    TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text("Enter Your phone number")),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
        
                  final credential = await PhoneAuthProvider.credential(
                      verificationId: widget.verificationId, smsCode: otpController.text);
        
                  await auth.signInWithCredential(credential);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

}
