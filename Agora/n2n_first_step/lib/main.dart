import 'package:flutter/material.dart';
import 'package:n2n_first_step/screens/confirmation_email.dart';
import 'package:n2n_first_step/screens/timeline.dart';
import 'package:n2n_first_step/screens/home_screen.dart';
import 'package:n2n_first_step/screens/loading_screen.dart';
import 'package:n2n_first_step/screens/login_screen.dart';
import 'package:n2n_first_step/screens/register_screen.dart';
import 'package:n2n_first_step/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:n2n_first_step/service/db_service.dart';
import 'package:n2n_first_step/service/navigation_service.dart';

void main() async {
  runApp(MyApp());
}

/*Widget buildError(BuildContext context, FlutterErrorDetails error) {
  return Scaffold(
    body: Center(
      child: Text(
        error.toString(),
        style: Theme.of(context).textTheme.title,
      ),
    ),
  );
}*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black54,
            fontFamily: "PT-Sans",
          ),
        ),
      ),
      home: HomeScreen(),
      initialRoute: HomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        EmailVerification.id: (context) => EmailVerification(),
      },
    );
  }
}
