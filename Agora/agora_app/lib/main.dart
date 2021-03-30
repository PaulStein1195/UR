import 'package:agora_app/pages/access_page.dart';
import 'package:agora_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';

import "./pages/login_page.dart";
import './pages/registration_page.dart';
import './pages/chat_page.dart';

import './services/navigation_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(42, 117, 188, 1),
        accentColor: Color.fromRGBO(42, 117, 188, 1),
        buttonColor: Color(0xFF005691),
        backgroundColor: Colors.white,
      ),
      initialRoute: "access",
      routes: {
        "access": (BuildContext _context) => AccessPage(),
        "login": (BuildContext _context) => LoginPage(),
        "register": (BuildContext _context) => RegistrationPage(),
        "home": (BuildContext _context) => MyHomePage(),
        "chat":(BuildContext _context) => ChatPage()
      },
    );
  }
}
