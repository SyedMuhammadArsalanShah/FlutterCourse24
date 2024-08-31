import 'dart:async';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:just_audio/just_audio.dart';

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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Recitation(index + 1),
                  ));
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
  DetailSurah(this.index, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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

class Recitation extends StatefulWidget {
  var indexSurah;
  Recitation(this.indexSurah, {super.key});

  @override
  State<Recitation> createState() => _RecitationState();
}

class _RecitationState extends State<Recitation> {
  AudioPlayer audioPlayer = AudioPlayer();
  IconData playpauseButton = Icons.play_circle_fill_rounded;
  bool isplaying = true;

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  Future<void> togglebtn() async {
    try {
      final audioUrl = await quran.getAudioURLBySurah(widget.indexSurah);
      audioPlayer.setUrl(audioUrl);

      if (isplaying) {
        audioPlayer.play();

        setState(() {
          playpauseButton = Icons.pause_circle_filled_rounded;
          isplaying = false;
        });
      } else {
        audioPlayer.pause();

        setState(() {
          playpauseButton = Icons.play_circle_fill_rounded;
          isplaying = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center( child:CircleAvatar(
            backgroundColor: Colors.brown[900],
            radius: 50,
            child: Image.network("https://i.scdn.co/image/ab6761610000e5ebac381d07bb60d7bfd3be1fe0"),) ,)
,          Center(child: IconButton(onPressed: togglebtn, icon: Icon(playpauseButton))),
        ],
      ),
    );
  }
}
