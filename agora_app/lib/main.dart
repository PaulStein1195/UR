import 'dart:ui';

import 'package:agora_app/pages/home_page.dart';
import 'package:agora_app/pages/access_page.dart';
import 'package:agora_app/pages/registration_page.dart';
import 'package:agora_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unknown',
      theme: ThemeData(
          fontFamily: "PT-Sans",
          backgroundColor: Color(0xfffafafa),
          primaryColor: Color(0xFF005691),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonColor: Color(0xFF005691),
          toggleableActiveColor: Color(0xFF071a52)),
      home: AccessPage(),
    );
  }
}
