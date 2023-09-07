import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();

  static const String routeName = "/login";
}

class _LoginPageState extends State<LoginPage> {
  // const LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/code.jpeg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (s) {},
                              decoration: InputDecoration(
                                  hintText: "Enter email",
                                  labelText: "Username"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              validator: (s) {},
                              decoration: InputDecoration(
                                  hintText: "Enter password",
                                  labelText: "Password"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Constants.prefs!.setBool("loggedIn", true);
                                Navigator.pushReplacementNamed(
                                    context, HomePage.routeName);
                                // if (Constants.prefs != null) {
                                //   Constants.prefs!.setBool("loggedIn", true);
                                //   Navigator.pushReplacementNamed(
                                //       context, HomePage.routeName);
                                // } else {
                                //   // Handle the case where Constants.prefs is null
                                //   print("SharedPreferences not init.");
                                // }
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => HomePage()));
                              },
                              child: Text("Signed In"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
