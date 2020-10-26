import 'package:flutter/material.dart';
import 'package:flutter_app11/5S/shine.dart';
import 'package:flutter_app11/5S/standardise.dart';
import 'package:flutter_app11/addedquestions.dart';
import 'package:flutter_app11/addquestion.dart';
import 'package:flutter_app11/example%202.dart';
import 'package:flutter_app11/example.dart';
import 'package:flutter_app11/google%20sign.dart';
import 'package:flutter_app11/mainpage.dart';
import 'package:flutter_app11/registerscreen.dart';
import 'package:flutter_app11/5S/setinorder.dart';
import 'welcomescreen.dart';
import 'loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'profile_menu/mainpagemenu.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}
class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      home: loginPage(),
    );
  }
}
