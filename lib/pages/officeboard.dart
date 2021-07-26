import 'package:flutter/material.dart';

class OfficePage extends StatelessWidget {
  const OfficePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Office Keyboards"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              KeyboardSlot(
                title: 'Microsoft',
                category: 'Office',
                img: AssetImage('images/microsoftsboard.png'),
              ),
              KeyboardSlot(
                title: 'Logitech',
                category: 'Office',
                img: AssetImage('images/logitechboard.png'),
              ),
              KeyboardSlot(
                title: 'Rii RK 907',
                category: 'Office',
                img: AssetImage('images/Rik907.png'),
              ),
              KeyboardSlot(
                title: 'WaterProof Thin Keyboard',
                category: 'Office',
                img: AssetImage(
                  'images/waterproofboardf.png',
                ),
              ),
              KeyboardSlot(
                  title: 'Waterproof Keyboard with Touchpad',
                  category: 'Office',
                  img: AssetImage('images/waterprooftouchpad.png'))
            ],
          ),
        ),
      ),
    );
  }
}

class Logitech extends StatelessWidget {
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
                      'Logitech Keyboard',
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Office Board',
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(
                        image: AssetImage('images/logitechboard.jpg'),
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

class microsoft extends StatelessWidget {
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
                      "Microsoft's Keyboard",
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Office Board',
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(
                        image: AssetImage('images/microsoftsboard.jpg'),
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

class Rik907 extends StatelessWidget {
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
                      'Rii RK907 Ultra-Slim',
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Office Board',
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(
                        image: AssetImage('images/Rik907.jpg'), height: 150),
                  ],
                )),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

class waterproof1 extends StatelessWidget {
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

class KeyboardSlot extends StatelessWidget {
  final String title;
  final String category;
  final ImageProvider img;

  const KeyboardSlot(
      {Key? key,
      required this.title,
      required this.category,
      required this.img})
      : super(key: key);

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
                      title,
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      category,
                      textScaleFactor: 0.7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Ink.image(image: img, height: 150),
                  ],
                )),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}
