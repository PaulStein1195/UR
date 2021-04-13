import 'dart:async';
import 'package:bonfire_newbonfire/screens/user_access/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = "loading";

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      //If user doesn't exist: Welcome Screen
      Navigator.pushNamed(context, WelcomeScreen.id);
      //Else: Home Screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.amber,
          size: 100.0,
        ),
      ),
    );
  }
}
