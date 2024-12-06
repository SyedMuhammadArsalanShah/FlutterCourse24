import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
