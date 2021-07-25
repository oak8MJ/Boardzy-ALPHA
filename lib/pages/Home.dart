import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BuildApexPro(),
            BuildClixKeyboard(),
            BuildMurphKeyboard(),
            BuildGk61(),
            BuildHuntsman()
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
