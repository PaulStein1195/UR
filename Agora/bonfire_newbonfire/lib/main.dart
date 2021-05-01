import 'package:bonfire_newbonfire/screens/ask_screen.dart';
import 'package:bonfire_newbonfire/screens/choose_bonfire_screen.dart';
import 'package:bonfire_newbonfire/screens/question_type_screen.dart';
import 'package:bonfire_newbonfire/screens/select_post_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/guide_screens.dart';
import 'package:bonfire_newbonfire/screens/user_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/screens/create_post_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/confirmation_email.dart';
import 'package:bonfire_newbonfire/screens/user_profile/profile_screen.dart';
import 'package:bonfire_newbonfire/test/timeline_screen_mockup.dart';
import 'package:bonfire_newbonfire/screens/home_screen.dart';
import 'package:bonfire_newbonfire/screens/loading_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/login_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/register_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/welcome_screen.dart';
import 'package:bonfire_newbonfire/service/navigation_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(
        primaryColor: Color(0XFF333333),
        accentColor: Color(0XFFffb21a),
        scaffoldBackgroundColor: Color.fromRGBO(41, 39, 40, 180.0),
        fontFamily: "Palanquin",

      ),
      initialRoute: "welcome",
      routes: {
        "login": (BuildContext _context) => LoginScreen(),
        "register": (BuildContext _context) => RegisterScreen(),
        "welcome": (BuildContext _context) => WelcomeScreen(),
        "home": (BuildContext _context) => HomeScreen(),
        "loading": (BuildContext _context) => LoadingScreen(),
        "email_verification": (BuildContext _context) => EmailVerification(),
        "profile": (BuildContext _context) => ProfileScreen(),
        "edit_profile": (BuildContext _context) => EditProfile(),
        "create_post": (BuildContext _context) => CreatePostPage(),
        "select_type_post": (BuildContext _context) => SelectPost(),
        "question_type": (BuildContext _context) => QuestionTypeScreen(),
        "ask": (BuildContext context) => AskScreen(),
        "bonfire_options": (BuildContext _context) => ChooseBonfireScreen(),
        "guide": (BuildContext _context) => Guide1(),
      },
    );
  }
}
