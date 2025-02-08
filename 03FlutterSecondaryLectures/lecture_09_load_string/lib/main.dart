import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SurahRahmanSCR(),
    );
  }
}

class SurahRahmanSCR extends StatefulWidget {
  const SurahRahmanSCR({super.key});

  @override
  State<SurahRahmanSCR> createState() => _SurahRahmanSCRState();
}

class _SurahRahmanSCRState extends State<SurahRahmanSCR> {
  Map mapResponse = {};
  List listResponse = [];
  getDataFromJson() async {
    final String response =
        await rootBundle.loadString("assets/mushaf/surahRahman.json");

    setState(() {
      mapResponse = jsonDecode(response);

      listResponse = mapResponse["data"]["ayahs"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: listResponse.length,
      itemBuilder: (context, index) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 200,
              width: double.infinity,
              color: const Color.fromARGB(255, 234, 224, 224),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    listResponse[index]["text"].toString(),
                    style: GoogleFonts.amiriQuran(fontSize: 25, ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
