import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/user.dart';

class ApiHelper {
  static ApiHelper _instance;

  static ApiHelper get instance  {
    if (_instance == null) {
      _instance = ApiHelper();
    }
    return _instance;
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> _onAuthStateChanged;

  ApiHelper() {
    if (_instance != null) {
      throw new StateError('Already created');
    }
  }
// TODO
//  set onAuthStateChanged(Stream<FirebaseUser> value) {
//    _auth.onAuthStateChanged = value;
//  }
//
  Future<User> loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser firebaseUser = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + firebaseUser.displayName);
      return User.fromFirebaseUser(firebaseUser);;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> logout() {
    return _auth.signOut();
  }
}
