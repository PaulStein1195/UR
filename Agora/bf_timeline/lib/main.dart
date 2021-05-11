import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

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
          accentColor: Color(0XFFffb21a),
          scaffoldBackgroundColor: Color.fromRGBO(41, 39, 40, 180.0),
          fontFamily: "Palanquin",

        ),
        home: OurRoot(),
      ),
    );
  }
}
