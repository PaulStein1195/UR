import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_fire/providers/firebase_methods.dart';
import 'package:map_fire/providers/firebase_repo.dart';
import 'package:map_fire/screens/home_screen.dart';
import 'package:map_fire/utils/universal_variables.dart';
import 'package:shimmer/shimmer.dart';

import 'location_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _repository = FirebaseRepo();
  bool isLoginPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mapfire",
              style: TextStyle(fontSize: 50.0, color: Colors.black54),
            ),
            SizedBox(
              height: 50.0,
            ),
            Stack(
              children: [
                Center(
                  child: GestureDetector(
                    child: Container(
                      width: 250.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                              image:
                                  AssetImage("assets/images/google_logo.png"),
                              height: 30.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text('Sign in with Google',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0)),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isLoginPressed = true;
                      });
                      _repository.googleSignIn().then((user) {
                        if (user != null) {
                          authenticateUser(user);
                        } else {
                          print("Error");
                        }
                      });
                    },
                  ),
                ),
                isLoginPressed
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container()
              ],
            )
          ],
        ));
  }

  void authenticateUser(FirebaseUser user) {
    print("Inside Login Screen -> authenticateUser");
    _repository.authenticateUser(user).then((value) {
      setState(() {
        isLoginPressed = false;
      });
      if (value) {
        print("VALUE : $value");
        print("INSIDE IF");
        _repository.addDataToDB(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return LocationScreen();
          }));
        });
      } else {
        print("INSIDE ELSE");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
    });
  }
}
