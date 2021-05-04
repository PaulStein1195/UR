import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/screens/new_user/bonfire_screen.dart';
import 'package:bonfire_newbonfire/screens/new_user/widgets/bonfire_avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../my_flutter_app_icons.dart';

class FirstSuggestionScreen extends StatelessWidget {
  final String arts = "Arts";
  final String education = "Education";
  final String social = "Social";
  final String nature = "Nature";
  final String tech = "Technology";
  final String other = "Other";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppbar(context),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select Bonfires",
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar_Widget(
                    text: tech, icon: MyFlutterApp.globe, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Bonfire_Categories_Screen(
                          bonfire: tech,
                        );
                      },
                    ),
                  );
                }),
                Avatar_Widget(
                    text: nature, icon: MyFlutterApp.earth, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Bonfire_Categories_Screen(
                          bonfire: nature,
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar_Widget(
                    text: social, icon: MyFlutterApp.users, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Bonfire_Categories_Screen(
                          bonfire: social,
                        );
                      },
                    ),
                  );
                }),
                Avatar_Widget(
                    text: education, icon: MyFlutterApp.book, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Bonfire_Categories_Screen(
                          bonfire: education,
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar_Widget(
                  text: arts,
                  icon: MyFlutterApp.brush_1,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Bonfire_Categories_Screen(
                            bonfire: arts,
                          );
                        },
                      ),
                    );
                  },
                ),
                Avatar_Widget(
                    text: other, icon: CupertinoIcons.add, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Bonfire_Categories_Screen(
                          bonfire: other,
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
