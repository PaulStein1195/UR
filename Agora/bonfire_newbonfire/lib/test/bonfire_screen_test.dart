import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/widget/teams_widget(test).dart';
import 'package:bonfire_newbonfire/widget/trends_widget.dart';

class BonfireScreenTest extends StatefulWidget {
  @override
  _BonfireScreenTestState createState() => _BonfireScreenTestState();
}

class _BonfireScreenTestState extends State<BonfireScreenTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color.fromRGBO(41, 39, 40, 200.0),
            expandedHeight: 55.0,
            title: Text(
              "Camping",
              style: TextStyle(color: Colors.white70),
            ),
            automaticallyImplyLeading: false,
            actions: [
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(child: Container(child: Text("WORKING AREA!", style: TextStyle(color: Colors.white70, fontSize: 25.0),)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
