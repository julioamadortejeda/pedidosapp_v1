// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  //final FirebaseAuth _firebaseAuth;
  // final GoogleSignIn _googleSignIn;

  // UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
  //     : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
  //       _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<void>singUp({String email, String password}) async {
    return await Future.delayed(Duration(seconds: 5));
  }

  Future<void>signOut() async {
    return Future.delayed(Duration(seconds: 3));
  }

  Future<bool> isSignedIn() async {
    // final currentUser = await _firebaseAuth.currentUser();
    // return currentUser != null;
    return false;
  }

  Future<String> getUser() async {
    //return (await _firebaseAuth.currentUser()).email;
    return null;
  }

  Future<void> signInWithCredentials(String email, String password) {
    // return .signInWithEmailAndPasswor_firebaseAuthd(
    //   email: email,
    //   password: password,
    // );
    Future.delayed(Duration(seconds: 3));
  }
}