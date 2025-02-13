import 'package:flutter/material.dart';
import 'package:lecturen_node_api_integration/Home.dart';
import 'services/Api.dart';



class Create extends StatefulWidget {

  Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController emailWA = TextEditingController();
  TextEditingController passWA = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.fromLTRB(8, 100, 8, 0),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 35,
            ),
            TextField(
              controller: emailWA,
              decoration: InputDecoration(
                hintText: ('Email'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passWA,
              decoration: InputDecoration(
                hintText: ('Password'),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 70,
                ),
                InkWell(
                  child: Text('Submit',
                      style: TextStyle(
                          color: Color.fromRGBO(5, 23, 128, 0.78),
                          fontSize: 15)),
                  onTap: () {
                    var data = {
                      "email": emailWA.text.toString(),
                      "pass": passWA.text.toString()
                    };

                    Api.postuserapi(data);


                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}