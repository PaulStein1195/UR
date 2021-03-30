import 'package:agora_app/pages/chat_page.dart';
import 'package:agora_app/pages/login_page.dart';
import 'package:agora_app/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/auth_provider.dart';


class AccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccessPageState();
  }
}

class _AccessPageState extends State<AccessPage> {
  double _deviceHeight;
  double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider.instance,
          child: _accessPageUI(),
        ),
      ),
    );
  }

  Widget _accessPageUI() {
    return Container(
          height: _deviceHeight * 0.95,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _headingWidget(),
              _access_options(),
            ],
          ),
        );
  }

  Widget _headingWidget() {
    return Container(
      height: _deviceHeight * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "UNKNOWN",
            style: kTitleStyle,
          ),
          Text(
            "Start been connected!",
            style: kH1,
          ),
        ],
      ),
    );
  }

  Widget _access_options() {
    return Container(
      height: _deviceHeight * 0.30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _continueButton(),
          _loginButton(),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _continueButton() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateTo("home");
      },
      child: Container(
          height: _deviceHeight * 0.06,
          width: _deviceWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.arrow_forward,
                color: Color(0xFF005691),
              ),
              Text(
                "Continue and remind me later",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    //fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    fontFamily: "PT-Sans"),
              ),
            ],
          )),
    );
  }

  Widget _loginButton() {
    return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              height: _deviceHeight * 0.065,
              width: _deviceWidth,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 8.0,
                onPressed: () {
                  NavigationService.instance.navigateTo("login");
                },
                color: Theme.of(context).buttonColor,
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PT-Sans",
                      color: Colors.white),
                ),
              ),
            ),
          );
  }

  Widget _registerButton() {
    return Container(
      height: _deviceHeight * 0.065,
      width: _deviceWidth,
      child: OutlineButton(
        splashColor: Theme.of(context).accentColor,
        onPressed: () {
          NavigationService.instance.navigateTo("register");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Color(0xFF005691)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Color(0xFF005691),
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
