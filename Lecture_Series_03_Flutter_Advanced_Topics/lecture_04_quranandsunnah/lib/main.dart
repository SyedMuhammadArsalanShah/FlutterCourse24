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
      title: 'Quran & Sunnah',
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
          context, MaterialPageRoute(builder: (context) => TabsScr()));
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
            "Quran & sunnah",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "jameel",
                fontSize: 30,
                color: Color(0XFFF2F2F2)),
          )),
          Center(
              child: Text(
            "القرآن والسنة",
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

class TabsScr extends StatefulWidget {
  const TabsScr({super.key});

  @override
  State<TabsScr> createState() => _TabsScrState();
}

class _TabsScrState extends State<TabsScr> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Quran & sunnah",
              style: TextStyle(
                color: Color(0xff010D26),
              ),
            ),
            centerTitle: true,
            // backgroundColor: Color(0XFF010D26),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xff010D26),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
              shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10), // Creates border
                  color: Color(0xff010D26)),
              tabs: [
                Tab(
                  text: "Quran",
                ),
                Tab(
                  text: "Hadith",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
           SurahIndex(),
            HadithsScreen(),
          ])),
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



class HadithsScreen extends StatefulWidget {
  const HadithsScreen({super.key});

  @override
  State<HadithsScreen> createState() => _HadithsScreenState();
}

class _HadithsScreenState extends State<HadithsScreen> {
  late Map mapresp;
  late List listresp = [];

  Future apicallkardo() async {
    var apiKey =
        "\$2y\$10\$BylaBcXs5Lw7ZOtYmQ3PXO1x15zpp26oc1FeGktdmF6YeYoRd88e";
    http.Response response = await http
        .get(Uri.parse("https://hadithapi.com/api/books?apiKey=$apiKey"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp = jsonDecode(response.body);
        listresp = mapresp["books"];
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
                      var bookslug = listresp[index]["bookSlug"];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChaptersScreen(bookslug),
                          ));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo[900],
                      radius: 30,
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(listresp[index]["bookName"]),
                    subtitle: Text(listresp[index]["writerName"]),
                    trailing: Column(
                      children: [
                        Text(listresp[index]["hadiths_count"]),
                        Text(listresp[index]["chapters_count"]),
                      ],
                    ));
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class ChaptersScreen extends StatefulWidget {
  var bookslug;
  ChaptersScreen(this.bookslug, {super.key});

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  late Map mapresp;
  late List listresp = [];

  Future apicallkardo() async {
    var bookname = widget.bookslug;
    var apiKey =
        "\$2y\$10\$BylaBcXs5Lw7ZOtYmQ3PXO1x15zpp26oc1FeGktdmF6YeYoRd88e";
    http.Response response = await http.get(Uri.parse(
        "https://hadithapi.com/api/$bookname/chapters?apiKey=$apiKey"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp = jsonDecode(response.body);
        listresp = mapresp["chapters"];
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
                      var bookslug = listresp[index]["bookSlug"];
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ChaptersScreen(bookslug),
                      //     ));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo[900],
                      radius: 30,
                      child: Text(
                        listresp[index]["chapterNumber"].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      listresp[index]["chapterArabic"],
                      style: GoogleFonts.amiriQuran(),
                    ),
                    subtitle: Text(
                      listresp[index]["chapterEnglish"] +
                          " | " +
                          listresp[index]["chapterUrdu"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "jameel",
                         ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
