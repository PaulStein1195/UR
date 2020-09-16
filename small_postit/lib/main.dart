import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:small_postit/pages/team_home_page.dart';
import 'package:small_postit/pages/main_home_page.dart';

import "./pages/login_page.dart";
import './pages/registration_page.dart';

import './services/navigation_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UrOpinion',
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(
          fontFamily: "PT-Sans",
          backgroundColor: Color(0xFFfffbe0),
          primaryColor: Color(0xFF474744),
          accentColor: Color(0xFFffb400),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonColor: Color(0xFF2994b2),
          dividerColor: Color(0xFF071a52),
        toggleableActiveColor: Color(0xFF071a52)
      ),
      initialRoute: "login",
      routes: {
        "login": (BuildContext _context) => LoginPage(),
        "register": (BuildContext _context) => RegistrationPage(),
        "home": (BuildContext _context) => Main_Home(),
      },
    );
  }
}
