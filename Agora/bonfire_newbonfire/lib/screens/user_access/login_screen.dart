import 'package:bonfire_newbonfire/service/snackbar_service.dart';
import 'package:flutter/material.dart';
import '../../providers/auth.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey;
  AuthProvider _auth;
  String _email;
  String _password;

  _LoginScreenState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider.instance,
          child: _loginUI(),
        ),
      ),
    );
  }

  Widget _loginUI() {
    return Builder(
      builder: (BuildContext _context) {
        SnackBarService.instance.buildContext = _context;
        _auth = Provider.of<AuthProvider>(_context);
        return Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState.save();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  height: 150.0,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/bonfire.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              //Email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
                validator: (_input) {
                  return _input.length != 0 && _input.contains("@")
                      ? null
                      : "Please enter a valid email";
                },
                onSaved: (_input) {
                  setState(() {
                    _email = _input;
                  });
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your email",
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              //Password
              TextFormField(
                obscureText: true,
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
                validator: (_input) {
                  return _input.length != 0 && _input.length > 6
                      ? null
                      : "Password need more than 6 characters";
                },
                onSaved: (_input) {
                  //Do something with the user input.
                  setState(() {
                    _password = _input;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: loginButton(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget loginButton() {
    return _auth.status == AuthStatus.Authenticating
        ? Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),)
        : Material(
      color: Colors.lightBlueAccent,//Colors.lightBlueAccent,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _auth.loginUserWithEmailAndPassword(_email, _password);
          }
        },
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          'Log In',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
