import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff023E73)),
        useMaterial3: true,
      ),
      home: const SplashScr(),
    );
  }
}

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), (() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SurahIndex()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff010D26),
              Color(0xff023E73),
            ]),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Quran ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "jameel",
                fontSize: 30,
                color: Color(0XFFF2F2F2)),
          )),
          Center(
              child: Text(
            "القرآن",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "jameel",
                fontSize: 30,
                color: Color(0XFFF2F2F2)),
          )),
        ],
      ),
    ))
        // backgroundColor: Color(0XFFD9D9D9)
        );
  }
}

class SurahIndex extends StatefulWidget {
  const SurahIndex({super.key});

  @override
  State<SurahIndex> createState() => _SurahIndexState();
}

class _SurahIndexState extends State<SurahIndex> {
  late Map mapresp;
  late List listresp = [];

  Future apicallkardo() async {
    http.Response response =
        await http.get(Uri.parse("https://api.alquran.cloud/v1/meta"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp = jsonDecode(response.body);
        listresp = mapresp["data"]["surahs"]["references"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicallkardo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listresp.isNotEmpty
            ? ListView.builder(
                itemCount: listresp == null ? 0 : listresp.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailSurah(index + 1),
                          ));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo[900],
                      radius: 30,
                      child: Text(
                        listresp[index]["number"].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(listresp[index]["name"] +
                        " | " +
                        listresp[index]["englishName"],style: GoogleFonts.amiriQuran(),),
                    subtitle: Text(listresp[index]["englishNameTranslation"]),
                    trailing: Text("Verses\n" +
                        listresp[index]["numberOfAyahs"].toString()),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      
    );
  }
}

class DetailSurah extends StatefulWidget {
  var indexnumber;
  DetailSurah(this.indexnumber, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  late Map mapresp;
  late List listresp = [];

  Future apicallkardo() async {
    int snum = widget.indexnumber;
    http.Response response =
        await http.get(Uri.parse("https://api.alquran.cloud/v1/surah/${snum}"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp = jsonDecode(response.body);
        listresp = mapresp["data"]["ayahs"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicallkardo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listresp.isNotEmpty
            ? ListView.builder(
                itemCount: listresp == null ? 0 : listresp.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listresp[index]["text"], style: GoogleFonts.amiriQuran(),textDirection: TextDirection.rtl,),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      
    );
  }
}

