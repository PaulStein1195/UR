import 'package:bonfire_newbonfire/screens/user_access/onboarding_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:flutter/widgets.dart';


class MainBFScreen extends StatefulWidget {
  @override
  _MainBFScreenState createState() => _MainBFScreenState();
}

class _MainBFScreenState extends State<MainBFScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: kFloatingAction(context),
      body: CustomScrollView(
        slivers: <Widget>[
          kMainAppBar(context),
          //TODO: If there is no Bonfires categories THEN...
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 7.0, vertical: 40.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Join_First_BF(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


