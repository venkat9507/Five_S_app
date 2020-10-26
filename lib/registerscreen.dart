import 'package:flutter/material.dart';
import 'package:flutter_app11/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app11/mainpage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth =FirebaseAuth.instance;
  String email;
  String password;
  String userName;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        body: SafeArea(child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(20),),color: Colors.white),
                  height: 450,width: 800,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('CREATE AN ACCOUNT',style: TextStyle(fontSize:20 ),),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3, ),
                          decoration: BoxDecoration(
                              color: Colors.lightGreenAccent,
                              borderRadius: BorderRadius.all(Radius.circular(32))),
                          child: TextField(onChanged: (value){
                            email= value;
                          },keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                hintText: 'EMAIL',
                                hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),

                                icon: Icon(Icons.email,
                                  color: Colors.white,
                                ),
                                // prefix: Icon(icon),
                                border: InputBorder.none),
                          ),
                        ),

                        SizedBox(height: 20,),
                         Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, ),
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: TextField(onChanged: (value){
                        password = value;
                      },obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'PASSWORD',
                            hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),

                            icon: Icon(Icons.lock,
                              color: Colors.white,
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
                              onPressed: () async{
                                setState(() {
                                  showSpinner = true;
                                });
                                try{
                                  final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                  if(newUser !=null){
                                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => mainPage()),
                      );
                                  }
                                  setState(() {
                                    showSpinner = true;
                                  });
                                }
                                catch (e){
                                  print(e);
                                }
                              },
                              minWidth: 200,
                              height: 42.0,
                              child: Text(
                                'REGISTER',
                              ),
                            ),
                          ),
                        ),
                        FloatingActionButton(backgroundColor: Colors.blueAccent,
                            child: Icon(Icons.arrow_back),
                            onPressed: (){
                          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => loginPage()),
  );

                        })

                      ],
                    ),
                  ),
                ),),
                Container(child: Image.asset("assets/logo.png"),)
              ],
            ),
          ),
        )),
      ),
    );
  }
}





