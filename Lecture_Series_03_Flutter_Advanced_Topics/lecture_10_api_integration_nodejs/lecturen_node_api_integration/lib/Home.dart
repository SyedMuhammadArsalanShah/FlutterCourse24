import 'package:flutter/material.dart';
import 'package:lecturen_node_api_integration/services/Api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Api userApi = Api();
  bool isLoading = true;
  TextEditingController emailWA = TextEditingController();
  TextEditingController passWA = TextEditingController();

  @override
  Future<void> fetchData() async {
    try {
      await userApi.getuserapi();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void initState() {
    // TODO: implement initState

    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userApi.userdata.length,
        itemBuilder: (context, index) {
          var data = userApi.userdata[index];
          return isLoading
              ? const Center(
                  child:
                      CircularProgressIndicator()) // Show a loading indicator while fetching data.
              : ListTile(
                  leading: Icon(Icons.storage),
                  title: Text(
                    data["email"],
                  ),
                  subtitle: Text(
                    data["pass"],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: ()  {
                            int id = data["id"];

                            emailWA.text = data["email"];
                            passWA.text = data["pass"];
                            //This custom  method
                            updateDialogBox(id, emailWA, passWA);

                            // setState(() {});
                          },
                          icon: Icon(Icons.edit_note)),
                      IconButton(
                          onPressed: () async {
                            var id = data["id"];

                            //This method from api class
                            await userApi.deleteuserapi(id);
                            await fetchData();

                            // setState(() {});
                          },
                          icon: Icon(Icons.delete_forever_rounded))
                    ],
                  ),
                );
        },
      ),
    );
  }

  void updateDialogBox(id, emailWA, passWA) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update your task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  var data = {
                    "email": emailWA.text.toString(),
                    "pass": passWA.text.toString()
                  };
                  await userApi.updateuserapi(id, data);
                  await fetchData();
                  Navigator.of(context).pop();
                },
                child: Text("Update")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"))
          ],
        );
      },
    );
  }
}