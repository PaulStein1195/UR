import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/screens/home_screen.dart';
import 'package:bonfire_newbonfire/service/navigation_service.dart';

class EmailVerification extends StatefulWidget {
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool _isUserEmailVerified;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    // ... any code here ...
    Future(
      () async {
        _timer = Timer.periodic(
          Duration(seconds: 2),
          (timer) async {
            await FirebaseAuth.instance.currentUser()
              ..reload();
            var user = await FirebaseAuth.instance.currentUser();
            if (user.isEmailVerified) {
              setState(
                () {
                  _isUserEmailVerified = user.isEmailVerified;
                  NavigationService.instance.navigateToReplacement("home");
                },
              );
              timer.cancel();
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/email1.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(height: 15.0),*/
            Text(
              "Verify your account in your email!",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            SpinKitDoubleBounce(
              color: Theme.of(context).accentColor,
              size: 60.0,
            ),
          ],
        ),
      ),
    );
  }
}
