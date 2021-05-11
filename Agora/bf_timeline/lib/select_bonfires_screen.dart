import 'package:bf_timeline/bonfire/technology.dart';
import 'package:bf_timeline/widgets/bonfire_avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bonfire/health.dart';
import 'bonfire/nature.dart';
import 'my_flutter_app_icons.dart';

class SelectBonfire extends StatelessWidget {
  final String arts = "Arts";
  final String education = "Education";
  final String health = "Health";
  final String nature = "Nature";
  final String tech = "Technology";
  final String other = "Other";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF333333),
      //appBar: kAppbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select Bonfires",
              style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar_Widget(context, text: nature, icon: MyFlutterApp.earth,
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Nature(
                          bonfire: nature,
                        );
                      },
                    ),
                  );
                }),
                Avatar_Widget(context, text: tech, icon: MyFlutterApp.globe,
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Technology(
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
                Avatar_Widget(context, text: health, icon: MyFlutterApp.users,
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Health(
                          bonfire: health,
                        );
                      },
                    ),
                  );
                }),
                /*Avatar_Widget(context, text: education, icon: MyFlutterApp.book,
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return BF_Education(
                          bonfire: education,
                        );
                      },
                    ),
                  );
                }),*/
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*Avatar_Widget(
                  context,
                  text: arts,
                  icon: MyFlutterApp.brush_1,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return BF_Arts(
                            bonfire: arts,
                          );
                        },
                      ),
                    );
                  },
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
