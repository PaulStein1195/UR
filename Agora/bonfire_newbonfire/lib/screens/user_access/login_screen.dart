import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/screens/home_screen.dart';
import 'package:bonfire_newbonfire/service/snackbar_service.dart';
import '../../providers/auth.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {

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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 39, 40, 200.0),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
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
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Email',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
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
                  decoration: kTextFieldDecoration.copyWith(),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  'Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
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
                  decoration: kTextFieldDecoration.copyWith(),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 23.0),
                  child: loginButton(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget loginButton() {
    return _auth.status == AuthStatus.Authenticating
        ? Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    )
        : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120.0),
      child: Material(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _auth.loginUserWithEmailAndPassword(_email, _password);
            }
          },
          minWidth: 150.0,
          height: 42.0,
          child: Text(
            'LOG IN',
            style: TextStyle(
                letterSpacing: 0.3,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
