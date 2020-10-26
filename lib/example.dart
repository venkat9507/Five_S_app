import 'package:flutter_app11/google sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String imageUrl;

Future<String> SignInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential Credential = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken,idToken: googleSignInAuthentication.idToken);
  final UserCredential authResult = await _auth.signInWithCredential(Credential);
  final User user = authResult.user;

  if (user !=null) {
    assert(user.displayName !=null);
    assert(user.photoURL !=null);
    if (name.contains(" ")){
      name = name.substring(0,name.indexOf(" "));
    }
    assert(!user.isAnonymous);
    assert(await user.getIdToken() !=null);
    
    final User currentUser = _auth.currentUser;
    assert (user.uid ==currentUser.uid);
    print( 'Sign In With Google successful : $user');
    return '$user';
  }
  return null;
}

Future<void> signOutGoogle() async {
 await googleSignIn.signOut();
 print('user signed out');
}