import 'package:bonfire_newbonfire/my_flutter_app_icons.dart';
import 'package:bonfire_newbonfire/widget/teams_widget(test).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseBonfireScreen extends StatefulWidget {
  @override
  _ChooseBonfireScreenState createState() => _ChooseBonfireScreenState();
}

class _ChooseBonfireScreenState extends State<ChooseBonfireScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              BonfireName("Nature", MyFlutterApp.earth, Colors.green),
              BonfireOptions(),
              BonfireName("Physics", MyFlutterApp.atom, Colors.white70),
              Expanded(child: BonfireOptions()),
              BonfireName("Space", MyFlutterApp.rocket, Colors.white70),
              Expanded(child: BonfireOptions()),
              BonfireName("Photography", MyFlutterApp.camera_1, Colors.purple),
              Expanded(child: BonfireOptions()),
              BonfireName("Animals", FontAwesomeIcons.dog, Colors.green),
              Expanded(child: BonfireOptions()),
              BonfireName("Music", MyFlutterApp.music, Colors.purple),
              Expanded(child: BonfireOptions()),
              BonfireName("Education", FontAwesomeIcons.graduationCap, Colors.blue),
              Expanded(child: BonfireOptions()),
            ],
          ),
        ),
      ),
    );
  }

  Widget BonfireName(String _title, IconData _icon, Color _iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Icon(
          _icon,
          color: _iconColor,
          ),
          SizedBox(width: 10.0,),
          Text(
            _title,
            style: TextStyle(color: Colors.white70,
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
