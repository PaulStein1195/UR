import 'package:bonfire_newbonfire/screens/new_user/widgets/notification_panel_widget.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:flutter/material.dart';

class Onboard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  Image_Logo('assets/images/Green-Flame.png'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Headline1('Welcome to Bonfire'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Headline2('Made by people like you to contribute and share in your community'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Amber_Btn_Widget(
                    context: context,
                    text: "CONTINUE",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Onboarding3(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  Image_Logo('assets/images/Blue-Flame.png'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Headline1('Participate - Get involved'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Headline2('Share, learn and divulge about things you like.'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Amber_Btn_Widget(
                    context: context,
                    text: "CONTINUE",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Onboarding3(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}*/

class Onboarding3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  Image_Logo('assets/images/Red-Flame.png'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Headline1('One Bonfire - One love'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Headline2('Each Bonfire has its own topic of discussion to keep it warm and tight!'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Amber_Btn_Widget(
                    context: context,
                    text: "DONE",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Notifications_Panel_Widget()),
                        ModalRoute.withName("splash"),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Image_Logo(String asset_image) {
  return Hero(
    tag: "logo",
    child: Container(
      height: 130.0,
      width: 105.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset_image),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}

Widget Headline1(String text) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.w800, color: Colors.white),
  );
}

Widget Headline2(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w400, color: Colors.white54),
  );
}
