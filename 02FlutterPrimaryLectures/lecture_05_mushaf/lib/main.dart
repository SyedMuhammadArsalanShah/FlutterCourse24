import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

    Timer(
        Duration(seconds: 3),
        () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Surahs(),
                  ))
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
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
        itemBuilder: (context, index) {
         return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailSurah(index+1),));
          },
            leading: Text("${index + 1}"),
            title: Text(quran.getSurahName(index + 1)),
            subtitle: Text(quran.getSurahNameEnglish(index + 1)),
          );
        },
        itemCount: quran.totalSurahCount,
      ),
    );
  }
}


class DetailSurah extends StatefulWidget {
var index;
DetailSurah(this.index,{super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
              itemCount: quran.getVerseCount(widget.index),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    quran.getVerse(widget.index, index + 1, verseEndSymbol: true),
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiriQuran(),
                  ),
                );
              },
            ),
          );
  }
}