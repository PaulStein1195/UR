import 'package:bonfire_newbonfire/screens/create_post_screen.dart';
import 'package:bonfire_newbonfire/screens/home_screen.dart';
import 'package:bonfire_newbonfire/location_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/confirmation_email.dart';
import 'package:bonfire_newbonfire/screens/user_access/login_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/register_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/welcome_screen.dart';
import 'package:bonfire_newbonfire/screens/user_profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        home: LoadingScreen(),
        routes: {
          "login": (BuildContext _context) => LoginScreen(),
          "register": (BuildContext _context) => RegisterScreen(),
          "welcome": (BuildContext _context) => WelcomeScreen(),
          "home": (BuildContext _context) => HomeScreen(),
          "loading": (BuildContext _context) => LoadingScreen(),
          "email_verification": (BuildContext _context) => EmailVerification(),
          "profile": (BuildContext _context) => ProfileScreen(),
          "create_post": (BuildContext _context) => CreatePostPage(),
        }
    );
  }

}