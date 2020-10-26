import 'dart:ui';
import 'mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app11/registerscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'example 2.dart';
import 'example.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
String mail;

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(inAsyncCall: showSpinner,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightGreenAccent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '5S',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 100),
                  ),
                  Text(
                    'Quality Management',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'WELCOME',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: TextField(style: TextStyle(color: Colors.lightGreenAccent),
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'EMAIL',
                          hintStyle: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontWeight: FontWeight.w500),
                          icon: Icon(
                            Icons.email,
                            color: Colors.lightGreenAccent,
                          ),
                          // prefix: Icon(icon),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: TextField(style: TextStyle(color: Colors.lightGreenAccent),
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'PASSWORD',
                          hintStyle: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontWeight: FontWeight.w500),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.lightGreenAccent,
                          ),
                          // prefix: Icon(icon),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: password);
                            mail = email;//Go to login screen.
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => mainPage()),
                            );
                            setState(() {
                              showSpinner = false;
                            });
                          }

                          catch (e) {
                            print(e);
                          }
                        },
                        minWidth: 200,
                        height: 42.0,
                        child: Text(
                          'Log In',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          SignInWithGoogle().then((result) {
                            if (result != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return mainPage();
                                  },
                                ),
                              );
                            }
                          });
                        },
                        minWidth: 200,
                        height: 42.0,
                        child: Text(
                          'SIGN IN WITH GOOGLE',
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()),
                          );
                        });
                      },
                      child: Text(
                        "Don't have an account? Register now",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_buildTextField(bool secure, TextEditingController controller, IconData icon,
    String labelText) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(32))),
    child: TextField(
      obscureText: secure,
      controller: controller,
      style: TextStyle(color: Colors.green),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.lightGreenAccent, fontSize: 30),
          icon: Icon(
            icon,
            color: Colors.lightGreenAccent,
          ),
          // prefix: Icon(icon),
          border: InputBorder.none),
    ),
  );
}
