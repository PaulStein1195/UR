import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: kAppbar(context),
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
                Text_Form_Widget("Email"),
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
                Text_Form_Widget("Password"),
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
        : Amber_Btn_Widget(
            context: context,
            text: "LOG IN",
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _auth.loginUserWithEmailAndPassword(_email, _password);
              }
            },
          );
  }
}
