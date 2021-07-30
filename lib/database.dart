import 'package:firebase_database/firebase_database.dart';


class DataBaseService {
  final connection = FirebaseDatabase.instance.reference();
  final DatabaseReference articlesCollection =
      FirebaseDatabase.instance.reference().child('articles');

  DataBaseService({uid});

  String uid = '';

  Future<void> updateFlutterArticlesUser(user, username) async {
    final usersReference = connection.child('users').child(user.uid);
    usersReference.set({
      'uid': user.uid,
      'email': user.email,
      'username': username,
      //add as many attributes as you want
    });
  }

  
  

  
}
