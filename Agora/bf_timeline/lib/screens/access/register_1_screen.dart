import 'package:bf_timeline/home_screen.dart';
import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/access/register_2_screen.dart';
import 'package:bf_timeline/widgets/amber_btn_widget.dart';
import 'package:bf_timeline/widgets/constants.dart';
import 'package:bf_timeline/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register1_Screen extends StatefulWidget {
  @override
  _Register1_ScreenState createState() => _Register1_ScreenState();
}

class _Register1_ScreenState extends State<Register1_Screen> {
  GlobalKey<FormState> _formKey;
  String name;

  _Register1_ScreenState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState.save();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text_Form_Widget("Username"),
                  TextFormField(
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    onSaved: (_input) {
                      setState(() {
                        name = _input;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter Name",
                    ),
                    validator: (_input) {
                      return _input.length != 0 && _input.length > 6
                          ? null
                          : "Username need more than 6 characters";
                    },
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Need to contain more than 6 characters",
                    style: TextStyle(color: Colors.grey, fontSize: 17.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60.0),
                  registerButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerButton() {
    return Amber_Btn_Widget(
      context: context,
      text: "NEXT",
      onPressed: () {
        if (_formKey.currentState.validate() != null) {
          //Implement registration functionality.
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    Register2_Screen(name: name)),
          );
        } else
          Navigator.pop(context);
      },
    );
  }
}
