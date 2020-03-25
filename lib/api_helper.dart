import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApiHelper {
  static ApiHelper _instance;

  static ApiHelper get instance  {
    if (_instance == null) {
      _instance = ApiHelper();
    }
    return _instance;
  }

  ApiHelper() {
    if (_instance != null) {
      throw new StateError('Already created');
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
