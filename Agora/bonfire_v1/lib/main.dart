import 'package:bonfire_v1/screens/login/login_screen.dart';
import 'package:bonfire_v1/utils/ourThemes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OurTheme().buildTheme(),
      //darkTheme: ThemeData.dark(),
      home: OurLogin()
    );
  }
}
