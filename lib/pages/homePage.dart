import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginPage.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../drawer.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var myText = "Change My Name";
  // TextEditingController _nameController = TextEditingController();

  var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Constants.prefs!.setBool("loggedIn", false);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: data != null
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]["title"]),
                  subtitle: Text("ID: ${data[index]["id"]}"),
                  leading: Image.network(data[index]["url"]),
                );
              },
              itemCount: data.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // setState(() {});
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
