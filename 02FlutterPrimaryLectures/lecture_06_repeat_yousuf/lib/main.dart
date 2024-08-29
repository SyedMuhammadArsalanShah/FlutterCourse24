import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
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

    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Surahs(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset("assets/images/quran.png"),
        ),
      ),
      backgroundColor: Colors.brown[900],
    );
  }
}

class Surahs extends StatefulWidget {
  const Surahs({super.key});

  @override
  State<Surahs> createState() => _SurahsState();
}

class _SurahsState extends State<Surahs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
          return ListTile(

            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Readsurah(index+1),));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.brown[900],
              child: Text("${index + 1}",style: TextStyle(color: Colors.white),),
            ),
            title: Text(
              quran.getSurahName(index + 1) +
                  " | " +
                  quran.getSurahNameArabic(index + 1),
              style: GoogleFonts.amiri(),
            ),
            subtitle: Text(quran.getSurahNameEnglish(index + 1)),
            trailing: Text(quran.getVerseCount(index + 1).toString()),
          );
        },
      ),
    );
  }
}



class Readsurah extends StatefulWidget {
  var surahnum;
Readsurah(this.surahnum, {super.key});

  @override
  State<Readsurah> createState() => _ReadsurahState();
}

class _ReadsurahState extends State<Readsurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
              itemCount: quran.getVerseCount(widget.surahnum),
              itemBuilder: (context, index) {
                return ListTile(
                
                  title: Text(
                    quran.getVerse(widget.surahnum, index + 1, verseEndSymbol: true),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiriQuran(),
                  ),
                );
              },
            ),
          );
  }
}