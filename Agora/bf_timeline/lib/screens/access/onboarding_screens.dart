import 'package:bf_timeline/widgets/amber_btn_widget.dart';
import 'package:flutter/material.dart';

import '../../select_bonfires_screen.dart';

class Onboard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF333333),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: [
                  Image_Logo('assets/images/Logo.png'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Headline1('Welcome to Bonfire!', Colors.white),
                  SizedBox(
                    height: 10.0,
                  ),
                  Headline2('Lets start growing together around your interests'),
                  SizedBox(
                    height: 50.0,
                  ),
                  Amber_Btn_Widget(
                    context: context,
                    text: "CONTINUE",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SelectBonfire(),
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
                  Headline1('One Bonfire - One love', Colors.redAccent),
                  SizedBox(
                    height: 10.0,
                  ),
                  Headline2('Each Bonfire has its own topic of discussion and people around it'),
                  SizedBox(
                    height: 50.0,
                  ),
                  Amber_Btn_Widget(
                    context: context,
                    text: "DONE",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Join_First_BF()),
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

class Join_First_BF extends StatelessWidget {
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
                  Image_Logo('assets/images/Yellow-Flame.png'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Headline1('"Join your first Bonfire!"', Colors.amber),
                  SizedBox(
                    height: 10.0,
                  ),
                  Headline2("Where do you want to be involved?"),
                  SizedBox(
                    height: 50.0,
                  ),
                  Amber_Btn_Widget(
                    context: context,
                    text: "START",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SelectBonfire(),
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



Widget Image_Logo(String asset_image) {
  return Hero(
    tag: "logo",
    child: Container(
      height: 160.0,
      width: 180.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset_image),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}

Widget Headline1(String text, Color color) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        fontSize: 35.0, fontWeight: FontWeight.bold, color: color),
  );
}

Widget Headline2(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w400, color: Colors.white70),
  );
}
