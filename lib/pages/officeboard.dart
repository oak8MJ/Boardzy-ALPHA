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
                title: 'Microsoft - Bluetooth Desktop ',
                category: 'Office',
                img: AssetImage('images/microsoftsboard.png'),
              ),
              KeyboardSlot(
                title: 'Logitech - Craft',
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
