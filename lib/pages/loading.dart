import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sdp_project/loadingPage.dart';
import 'package:sdp_project/pages/admin_addFlight.dart';
import 'package:sdp_project/pages/login.dart';
import 'package:sdp_project/pages/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Center(
          child: Image.asset("assets/images/Gif1.gif"),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Screen Example")),
      body: Center(
          child: Text("Welcome to Home Page",
              style: TextStyle(color: Colors.black, fontSize: 30))),
    );
  }
}
