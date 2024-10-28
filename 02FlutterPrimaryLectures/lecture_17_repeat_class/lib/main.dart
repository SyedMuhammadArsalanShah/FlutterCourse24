import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Repeat(),
    );
  }
}



class Repeat extends StatefulWidget {
  const Repeat({super.key});

  @override
  State<Repeat> createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {
 @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Repeat Topics"),
            bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.indigo[900],
                indicator: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: Color(0XFF023E73)),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: "Cards and Date",
                    icon: Icon(Icons.info),
                  ),
                  Tab(
                    text: "Text Field",
                    icon: Icon(Icons.data_exploration),
                  ),
                  Tab(
                    text: "Custom Widget",
                    icon: Icon(Icons.dashboard_customize),
                  ),
                  Tab(
                    text: "bmi calculator",
                    icon: Icon(Icons.calculate),
                  ),
                  Tab(
                    text: "Api ",
                    icon: Icon(Icons.api),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Cards(),
            TextFieldScreen(),
            CustomWidgets(),
            BMICalculator(),
            HadithsScreen(),
          ]),
        ));
  }
}




class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
      var time = DateTime.now();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // simple card
            Card(
              child: ListTile(
                title: Text("SMAS"),
              ),
            ),
            // color card
            Card(
              child: ListTile(
                title: Text(
                  "Date Time ${time.hour}:${time.minute} ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.green,
            ),

            // elevated card
            Card(
              child: ListTile(
                title: Text("SMAS ${DateFormat("jms").format(time)}"),
              ),
              elevation: 8,
            ),
            // shadow card
            Card(
              child: ListTile(
                title: Text("SMAS"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
            ),
            // shape
            Card(
              child: ListTile(
                title: Text("SMAS ${time.hour}"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),

            // margin
            Card(
              child: ListTile(
                //leading: Icon(Icons.music_note),
                title: Text("SMAS"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
            ),

            // height and width
            Container(
              height: 200,
              width: 200,
              child: Card(
                child: ListTile(
                  title: Text("SMAS"),
                ),
                elevation: 8,
                shadowColor: Colors.green,
                margin: EdgeInsets.all(20),
              ),
            ),

            // rounded corners

            Card(
              child: ListTile(
                title: Text("SMAS"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)),
            ),
            // border and border color
            Card(
              child: ListTile(
                title: Text("SMAS"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green, width: 1)),
            ),

            // circular card
            Card(
              child: Container(
                height: 160,
                width: 160,
                child: Center(
                  child: ListTile(
                    title: Text("SMAS"),
                  ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
 TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: useremail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.green,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                onPressed: () {
                  print("bhai info ");
                },
              ),
              label: Text("Enter your Fav"),
              hintText: "enter your email",
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.circular(14)),
              // disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey, width: 2), borderRadius:  BorderRadius.circular(14)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
          Container(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            obscureText: true,
            obscuringCharacter: "*",
            controller: userpass,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.green,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                onPressed: () {
                  print("bhai info ");
                },
              ),
              hintText: "enter your pass",
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                  borderRadius: BorderRadius.circular(14)),
              // disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey, width: 2), borderRadius:  BorderRadius.circular(14)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                String email = useremail.text.toString();
                String pass = userpass.text;

                print("My Email${email}");
                print("My Pass${pass}");
              },
              child: Text("Login"))
        ],
      ),
    );
}
}
class CustomWidgets extends StatefulWidget {
  const CustomWidgets({super.key});

  @override
  State<CustomWidgets> createState() => _CustomWidgetsState();
}

class _CustomWidgetsState extends State<CustomWidgets> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
                      var chapterNumber = listresp[index]["chapterNumber"];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HadithScreen(bookslug, chapterNumber),
                          ));
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



class HadithScreen extends StatefulWidget {
  var bookSlug;
  var chapterNumber;
 HadithScreen(this.bookSlug,this.chapterNumber, {super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {



  late Map mapresp;
  late List listresp = [];

  Future apicallkardo() async {
    var bookname = widget.bookSlug;
    var chapterNumber = widget.chapterNumber;
    var apiKey =
        "\$2y\$10\$BylaBcXs5Lw7ZOtYmQ3PXO1x15zpp26oc1FeGktdmF6YeYoRd88e";
    http.Response response = await http.get(Uri.parse(
        "https://hadithapi.com/public/api/hadiths?apiKey=$apiKey&book=$bookname&chapter=$chapterNumber&paginate=1000000"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp = jsonDecode(response.body);
        listresp = mapresp["hadiths"]["data"];
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
         body: ListView.builder(
          itemCount: listresp.length,
          itemBuilder: (context, index) {
           return ListTile(title: Text(listresp[index]["hadithArabic"],style: TextStyle(fontFamily: "myarabic"),),);
         },),



    );
  }
}