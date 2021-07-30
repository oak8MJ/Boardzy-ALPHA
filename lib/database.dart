import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

import 'package:uuid/uuid.dart';

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
