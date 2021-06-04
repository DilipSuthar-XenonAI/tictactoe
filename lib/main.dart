import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/screens/settings.dart';
import './screens/playermodescreen.dart';
import './screens/playerselection.dart';
import './screens/playground.dart';
import 'package:provider/provider.dart';
import 'backend/script.dart';
import './screens/construction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Game(),
      child: MaterialApp(
        title: "The Tic-Tac-Toe",
        theme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 25, color: Color(0xff283c5b)),
              bodyText2: TextStyle(fontSize: 20),
            ),
            scaffoldBackgroundColor: Colors.white),
        routes: {
          'playermodescreen': (context) => PlayerModeScreen(),
          'playerselection': (context) => PlayerSelection(),
          'playground': (context) => PlayGround(),
          'settings': (context) => Settings(),
          'construction': (context) => Construction(),
        },
        debugShowCheckedModeBanner: false,
        home: Mysplash(),
      ),
    );
  }
}

class Mysplash extends StatefulWidget {
  @override
  _MysplashState createState() => _MysplashState();
}

class _MysplashState extends State<Mysplash> {
  starttimeout() {
    return Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "playermodescreen");
    });
  }

  @override
  void initState() {
    super.initState();
    starttimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "The Tic-Tac-Toe",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
