import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pages_familiar/login.dart';
import 'package:pages_familiar/models/message_model.dart';
import 'package:pages_familiar/pages/appbar.dart';
import 'package:pages_familiar/pages/social.dart';
import 'package:pages_familiar/screens/home_screen.dart';
import 'package:pages_familiar/pages/gaming.dart';
import 'package:pages_familiar/pages/landingpage.dart';
import 'package:pages_familiar/pages/officeboard.dart';
import 'package:pages_familiar/pages/settings.dart';
import 'package:pages_familiar/pages/signup.dart';
import 'package:pages_familiar/screens/chat_screen.dart';
import 'package:pages_familiar/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;
  //connnecting to firebase

  void initiallizeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      print(e.toString());
      _error = true;
    }
  }

  @override
  void initState() {
    initiallizeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container(
        child: Text('Failed to connect'),
      );
    }
    if (!_initialized) {
      return Container(
        child: Text('Connecting', textDirection: TextDirection.ltr),
      );
    }

    return Streamer();
  }
}

class Streamer extends StatefulWidget {
  const Streamer({Key? key}) : super(key: key);

  @override
  _StreamerState createState() => _StreamerState();
}

class _StreamerState extends State<Streamer> {
  final _streamProvider = AuthService().user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginDemo(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignInDemo(),
        '/settings': (context) => SettingsPage(),
        '/Office': (context) => OfficePage(),
        '/gaming': (context) => GamingPage(),
        '/Chat': (context) => CreateKeyboard(),
        '/Chatjohn': (context) => ChatScreen(user: john),
      },
      home: StreamBuilder(
          stream: _streamProvider,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Container(child: Text('Still waiting'))
                  : Container(
                      child: SignInDemo(),
                    ); //login screen
            } else {
              return HomePage();
            }
          }),
    );
  }
}
