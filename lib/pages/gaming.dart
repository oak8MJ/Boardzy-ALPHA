import 'package:flutter/material.dart';

class GamingPage extends StatelessWidget {
  const GamingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gaming Keyboards"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              KeyboardSlot(
                title: 'Razer Huntsman',
                category: 'Gaming',
                img: AssetImage('images/razerhuntsman.png'),
              ),
              KeyboardSlot(
                title: 'Logitech G915',
                category: 'Gaming',
                img: AssetImage('images/logitechG.png'),
              ),
              KeyboardSlot(
                title: 'Corsair K70',
                category: 'Gaming',
                img: AssetImage('images/corsair.png'),
              ),
              KeyboardSlot(
                title: 'Alienware AW510K',
                category: 'Gaming',
                img: AssetImage(
                  'images/alienware.png',
                ),
              ),
              KeyboardSlot(
                title: 'Red Dragon K630',
                category: 'Gaming',
                img: AssetImage(
                  'images/RedDragon.png',
                ),
              ),
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
