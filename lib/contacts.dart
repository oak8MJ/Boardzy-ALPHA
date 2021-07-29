import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pages_familiar/add_contacts.dart';
import 'package:pages_familiar/edit_contact.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  late Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('Post');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Post')
        .orderByChild('category');
  }

  Widget _buildPostItem({required Map Post}) {
    Color categoryColor = getcategoryColor(Post['category']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 130,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                Post['Image'],
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.phone_iphone,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                Post['title'],
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.group_work,
                color: categoryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                Post['category'],
                style: TextStyle(
                    fontSize: 16,
                    color: categoryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditPost(
                                PostKey: Post['key'],
                              )));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Edit',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  _showDeleteDialog(Post: Post);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Delete',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }

  _showDeleteDialog({required Map Post}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${Post['Image']}'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              FlatButton(
                  onPressed: () {
                    reference
                        .child(Post['key'])
                        .remove()
                        .whenComplete(() => Navigator.pop(context));
                  },
                  child: Text('Delete'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Post'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map Post = snapshot.value;
            Post['key'] = snapshot.key;
            return _buildPostItem(Post: Post);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return AddPost();
            }),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Color getcategoryColor(String category) {
    Color color = Theme.of(context).accentColor;

    if (category == 'Office') {
      color = Colors.brown;
    }

    if (category == 'Gaming') {
      color = Colors.green;
    }

    return color;
  }
}
