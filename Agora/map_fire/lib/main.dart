import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_fire/screens/home_screen.dart';
import 'package:map_fire/screens/location_screen.dart';
import 'package:map_fire/screens/login_screen.dart';
import 'package:map_fire/providers/firebase_repo.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  FirebaseRepo _repository = FirebaseRepo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapfire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if(snapshot.hasData) {
            return LocationScreen();
          } else {
            return LoginScreen();
          }
        },
      )
    );
  }
}

