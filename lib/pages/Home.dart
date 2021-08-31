import 'dart:ui';
import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pages_familiar/pages/posts.dart';

final DBRef = FirebaseDatabase.instance.reference();

class BlogPage extends StatefulWidget {
  BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List postList = [];
  @override
  void initState() {
    super.initState();

    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child('Post');
    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postList.clear();

      for (var individualKey in KEYS) {
        Posts posts = new Posts(
          DATA[individualKey]['category'],
          DATA[individualKey]['image'],
          DATA[individualKey]['title'],
          DATA[individualKey]['uid'],
        );
        postList.add(posts);
      }
      var postLength = postList.length;
      setState(() {
        print('Length : $postLength');
      });
    });
  }

  Widget build(BuildContext context) {
    // var postList;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("Home"),
          automaticallyImplyLeading: false,
        ),
        body: new Container(
          child: postList.length == 0
              ? new Text('No Posted Keyboards')
              : new ListView.builder(
                  itemCount: postList.length == 0 ? 0 : postList.length,
                  itemBuilder: (_, index) {
                    return PostsUI(
                        postList[index].category,
                        postList[index].image,
                        postList[index].title,
                        postList[index].uid);
                  },
                ),
        ));
  }

  Widget PostsUI(String category, String image, String title, String uid) {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        padding: EdgeInsets.all(14.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  category,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                new Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                new Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BuildApexPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade800,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      'Apex Pro TKL',
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Gaming Board',
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(
                        image: AssetImage('images/apexpro.jpg'), height: 150),
                  ],
                )),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

class BuildClixKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade800,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      "Clix's Keyboard",
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Creator Board',
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(
                        image: AssetImage('images/clixkeyboard.png'),
                        height: 150),
                  ],
                )),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

class BuildMurphKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade800,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      "Murph Frags's Keyboard",
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Creator Board',
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(
                        image: AssetImage('images/murphboard.png'),
                        height: 150),
                  ],
                )),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

class BuildGk61 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade800,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      'GK 61',
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Gaming Board',
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(
                        image: AssetImage('images/gk61.png'), height: 150),
                  ],
                )),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

class BuildHuntsman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade800,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      'Razer Huntsman',
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Gaming Board',
                      textScaleFactor: 0.7,
                    ),
                    Ink.image(
                        image: AssetImage('images/razerhuntsman.png'),
                        height: 200),
                  ],
                )),
          ],
        ));
  }
}
