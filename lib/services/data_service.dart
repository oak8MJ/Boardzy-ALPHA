import 'package:firebase_database/firebase_database.dart';

class DataService {
  final String uid;
  DataService({required this.uid});
  final connection = FirebaseDatabase.instance.reference();

  //save user

  Future<void> saveUser(user) async {
    final userRef = connection.child('users').child(user.uid);
    userRef.set({
      'uid': user.uid,
      'email': user.email,
    });
  }
}
