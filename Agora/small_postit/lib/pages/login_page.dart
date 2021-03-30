import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

import '../services/snackbar_service.dart';
import '../services/navigation_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double _deviceHeight;
  double _deviceWidth;

  GlobalKey<FormState> _formKey;
  AuthProvider _auth;

  String _email;
  String _password;

  _LoginPageState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,//Theme.of(context).backgroundColor,
      body: Align(
        alignment: Alignment.center,
        child: ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider.instance,
          child: _loginPageUI(),
        ),
      ),
    );
  }

  Widget _loginPageUI() {
    return Builder(
      builder: (BuildContext _context) {
        SnackBarService.instance.buildContext = _context;
        _auth = Provider.of<AuthProvider>(_context);
        return Container(
          height: _deviceHeight * 0.85,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _headingWidget(),
              _inputForm(),
              _loginButton(),
              _signInButton(),
              Divider(),
              _registerButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _headingWidget() {
    return Container(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "UrOpinion",
            style: TextStyle(fontSize: 60, fontFamily: "Pacifico", color: Theme.of(context).primaryColor, shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 5.0),
                blurRadius: 5.0,
                color: Colors.grey.shade400,
              ),
            ],),
          ),
          Text(
            "Welcome back!",
            style: TextStyle(fontSize: 25, fontFamily: "PT-Sans", color: Theme.of(context).accentColor, ),
          ),
        ],
      ),
    );
  }

  Widget _inputForm() {
    return Container(
      height: _deviceHeight * 0.16,
      child: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState.save();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      autocorrect: false,
      style: TextStyle(color: Theme.of(context).accentColor),
      validator: (_input) {
        return _input.length != 0 && _input.contains("@")
            ? null
            : "Please enter a valid email";
      },
      onSaved: (_input) {
        setState(() {
          _email = _input;
        });
      },
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        hintText: "Email Address",
        hintStyle: TextStyle(fontFamily: "PT-Sans"),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).accentColor),
      validator: (_input) {
        return _input.length != 0 ? null : "Please enter a password";
      },
      onSaved: (_input) {
        setState(() {
          _password = _input;
        });
      },
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(fontFamily: "PT-Sans"),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return _auth.status == AuthStatus.Authenticating
        ? Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    )
        : Container(
      height: _deviceHeight * 0.06,
      width: _deviceWidth,
      child: MaterialButton(
        elevation: 8.0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _auth.loginUserWithEmailAndPassword(_email, _password);
          }
        },
        color: Theme.of(context).buttonColor,
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: "PT-Sans", color: Colors.white),
        ),
      ),
    );
  }
  Widget _signInButton() {
    return Container(
      height: _deviceHeight * 0.065,
      width: _deviceWidth,
      child: OutlineButton(
        splashColor: Theme.of(context).accentColor,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/images/google_logo.png"),
                  height: 35.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateTo("register");
      },
      child: Container(
        height: _deviceHeight * 0.06,
        width: _deviceWidth,
        child: Text(
          "REGISTER",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor, fontFamily: "PT-Sans"),
        ),
      ),
    );
  }
}
