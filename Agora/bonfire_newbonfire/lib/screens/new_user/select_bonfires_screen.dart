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
  final String tech = "Tech";
  final String other = "Other";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: kAppbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
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
                Avatar_Widget(context, text: nature, icon: MyFlutterApp.earth, image: "Green-Flame",
                    onTap: () {
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
                Avatar_Widget(context, text: tech, icon: MyFlutterApp.globe, image: "Blue-Flame",
                    onTap: () {
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar_Widget(context,
                    text: social,
                    icon: MyFlutterApp.users,
                    image: "Yellow-Flame", onTap: () {
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
                Avatar_Widget(context, text: education, icon: MyFlutterApp.book, image: "Blue-Flame",
                    onTap: () {
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
                  context,
                  text: arts,
                  icon: MyFlutterApp.brush_1,
                  image: "Red-Flame",
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
                Avatar_Widget(context, text: other, icon: Icons.add, image: "Yellow-Flame", onTap: () {
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
