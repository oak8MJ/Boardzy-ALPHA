import 'package:firebase_auth/firebase_auth.dart';
import 'package:pages_familiar/models/MyAppUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create MyAppUser from Firebase User

  MyAppUser? _userfromFirebaseUser(User? user) {
    user != null ? MyAppUser(uid: user.uid, email: user.email) : null;
  }

  //create Firebase User

  Future registerFirebaseUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //login Firebase User
  Future loginFirebaseUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOutFirebaseUser() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Stream<MyAppUser?> get user => _auth.authStateChanges().map(_userfromFirebaseUser);
}
