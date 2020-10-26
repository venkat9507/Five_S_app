import 'package:flutter/material.dart';
import 'package:flutter_app11/5S/shine.dart';
import 'package:flutter_app11/5S/sort.dart';
import 'package:flutter_app11/5S/standardise.dart';
import 'package:flutter_app11/5S/sustain.dart';
import 'package:flutter_app11/addquestion.dart';
import 'package:flutter_app11/profile_menu/mainpagemenu.dart';
import 'registerscreen.dart';
import 'package:flutter_app11/5S/setinorder.dart';
import 'package:firebase_auth/firebase_auth.dart';

int _ratingController;

class mainPage extends StatefulWidget {
  User user;
  mainPage({this.user});
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.article,
                        color: Colors.lightGreenAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Menu(),
                          ),
                        );
                      },heroTag: 'btn1',
                    ),
                  ),
                ],
              ),
              Text(
                '5S',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children: [
                  FlatButton(
                    onPressed: (){
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sort()),
                      );

                    });
                  },
                    child: Container(height: 100,width: 120,
                      color: Colors.lightGreenAccent,
                      child: Image.asset('assets/sort.png'),
                    ),
                  ),
                  SizedBox(width: 20,),
                  FlatButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => setInOrder()),
                    );

                  },
                    child: Container(height: 100,width: 100,
                      color: Colors.lightGreenAccent,
                      child: Image.asset('assets/set in order.png'),
                    ),
                  ),

                ],),

              ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(children: [
          FlatButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Shine()),
            );
          },
            child: Container(height: 100,width: 120,
              color: Colors.lightGreenAccent,
              child: Image.asset('assets/shine.png'),
            ),
          ),
          SizedBox(width: 20,),
          FlatButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Standardise()),
            );
          },
            child: Container(height: 100,width: 100,
              color: Colors.lightGreenAccent,
              child: Image.asset('assets/standardise.png'),
            ),
          ),

        ],),),
             Column(mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 FlatButton(onPressed: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Sustain()),
                   );
                 },
                   child: Padding(padding: EdgeInsets.all(8),

                     child: Container(
                       height: 100,width: 190,

                       child: Image.asset('assets/sustain.png'),
                     ),
                   ),
                 ),
               ],
             )




            ],
          ),
        ),
      ),
    );
  }
}
