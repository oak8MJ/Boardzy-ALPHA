import 'package:flutter/material.dart';
import 'package:pages_familiar/login.dart';
import 'package:pages_familiar/pages/appbar.dart';
import 'package:pages_familiar/pages/gaming.dart';
import 'package:pages_familiar/pages/landingpage.dart';
import 'package:pages_familiar/pages/officeboard.dart';
import 'package:pages_familiar/pages/settings.dart';
import 'package:pages_familiar/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
      routes: {
        '/login': (context) => LoginDemo(),
        '/home': (context) => HomePage(),
        '/signin': (context) => SignInDemo(),
        '/settings': (context) => SettingsPage(),
        '/Office': (context) => OfficePage(),
        '/gaming': (context) => GamingPage(),
      },
    );
  }
}
