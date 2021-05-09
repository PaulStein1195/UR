import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:bonfire_newbonfire/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';

class AskScreen extends StatefulWidget {
  @override
  _AskScreenState createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  GlobalKey<FormState> _formKey;
  AuthProvider _auth;
  String _question;
  String _questionId = Uuid().v4();

  _AskScreenState() {
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
          child: _askUI(),
        ),
      ),
    );
  }

  Widget _askUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Builder(
          builder: (BuildContext context) {
            _auth = Provider.of<AuthProvider>(context);
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
                      'Ask your Question',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    TextFormField(
                      minLines: 2,
                      maxLines: 4,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: Colors.grey.shade200, fontSize: 20.0),
                      textAlign: TextAlign.center,
                      validator: (_input) {
                        return _input.length != 0
                            ? null
                            : "Did you ask anything?";
                      },
                      onSaved: (_input) {
                        setState(() {
                          _question = _input;
                        });
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 23.0),
                      child: StreamBuilder<User>(
                        stream: DBService.instance.getUserData(_auth.user.uid),
                        builder: (context, _snapshot) {
                          var _data = _snapshot.data;
                          return Amber_Btn_Widget(
                            context: context,
                            text: "ASK",
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                //TODO: Make question
                                DBService.instance.createQuestion(
                                    _data.id,
                                    _data.name,
                                    _data.image,
                                    _question,
                                    _questionId);
                                setState(() {
                                  _questionId = Uuid().v4();
                                });
                                NavigationService.instance
                                    .navigateToReplacement("home");
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
