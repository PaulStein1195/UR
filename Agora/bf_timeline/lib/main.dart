import 'package:bf_timeline/home_screen.dart';
import 'package:bf_timeline/screens/access/onboarding_screens.dart';
import 'package:bf_timeline/screens/access/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bf_timeline/providers/auth_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => CurrentUser(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0XFF333333),
          //accentColor: Color(0XFFffb21a),
          scaffoldBackgroundColor: Color.fromRGBO(41, 39, 40, 180.0),
          fontFamily: "Palanquin",
        ),
        initialRoute: "root",
        routes: {
          "root": (BuildContext context) => OurRoot(),
          "home": (BuildContext context) => HomeScreen(),
          "onboarding": (BuildContext context) => Onboard1(),
        },
      ),
    );
  }
}
