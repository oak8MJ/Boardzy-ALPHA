import 'package:firebase_database/firebase_database.dart';
import 'package:pages_familiar/models/post.dart';
import 'package:uuid/uuid.dart';

class DataService {
  final connection = FirebaseDatabase.instance.reference();

  //save user

  Future<void> saveUser(user) async {
    final userRef = connection.child('users').child(user.uid);
    userRef.set({
      'uid': user.uid,
      'email': user.email,
    });
  }

  //savepost
  Future<Post> savePost(image, title, category) async {
    var id = Uuid().v1();
    final postRef = connection.child('Post').child(id);
    postRef
        .set({'uid': id, 'image': image, 'title': title, 'category': category});
    return Post(title ,category: category, image: image, uid: id, title: '$title');

    
  }
  
}
