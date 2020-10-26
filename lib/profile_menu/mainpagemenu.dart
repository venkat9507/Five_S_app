import 'package:flutter/material.dart';
import 'package:flutter_app11/loginpage.dart';
import 'package:flutter_app11/mainpage.dart';
import 'package:flutter_app11/profile_menu/profile.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SafeArea(
          child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            color: Colors.white),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mainPage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.lightGreenAccent,
                      size: 30,
                    ),
                  ),
                ),
                Text(
                  'MENU',
                  style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.lightGreenAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.lightGreenAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>loginPage(),
                          ),
                        );
                      },
                        child: Text(
                          'Signout',
                          style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.lightGreenAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(onPressed: (){

                      },
                        child: Text(
                          'Reports',
                          style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
