import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app11/example%202.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_app11/example.dart';

 GoogleSignIn _googleSignIn = GoogleSignIn(
   scopes: <String> [
     'email',
   ]
 );
class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {

  GoogleSignInAccount _currentUser;
  Future<void> _handleSignIn() async{
    try{
      await _googleSignIn.signIn();
    }catch(e){
      print(e);
    }
  }

  Widget roundedButton() {
    return OutlineButton(onPressed: () {
      SignInWithGoogle().then((result) {
        if (result != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return FirstScreen();
              },
            ),
          );
        }
      });
    },
      child: Material(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: Center(
              child: Text('sign in with google',style: TextStyle(fontSize: 20,color: Colors.black),),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser =account;
        Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstScreen() ));
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: Center(
        child: roundedButton(),
      ),
    );
  }
}
