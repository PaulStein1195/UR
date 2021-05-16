import 'dart:async';
import 'package:bf_timeline/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen()),
                      ModalRoute.withName('/'));
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
      backgroundColor: Color(0XFF333333),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/email1.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Check your email to verify your account",
                style: TextStyle(
                    color: Colors.orange, //Theme.of(context).accentColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                "And come back once you are done!",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              /*SpinKitDoubleBounce(
                color: Theme.of(context).accentColor,
                size: 60.0,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
