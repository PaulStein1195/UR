import 'package:flutter/material.dart';
import '../home_screen.dart';

class Guide1 extends StatelessWidget {
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
                  Hero(
                    tag: "logo",
                    child: Container(
                      height: 100.0,
                      width: 105.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo_shadow.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Welcome to Bonfire',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Made by people like you to contribute over a topic',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 23.0),
                    child: Material(
                      color: Theme
                          .of(context)
                          .accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              BuildContext context) => Guide2(),),);
                        },
                        minWidth: 150.0,
                        height: 42.0,
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(
                              letterSpacing: 0.3,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class Guide2 extends StatelessWidget {
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
                  Hero(
                    tag: "logo",
                    child: Container(
                      height: 100.0,
                      width: 105.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo_shadow.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Participate - Get involved',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Share, learn and divulge about things you like.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 23.0),
                    child: Material(
                      color: Theme
                          .of(context)
                          .accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              BuildContext context) => Guide3(),),);
                        },
                        minWidth: 150.0,
                        height: 42.0,
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(
                              letterSpacing: 0.3,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Guide3 extends StatelessWidget {
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
                  Hero(
                    tag: "logo",
                    child: Container(
                      height: 100.0,
                      width: 105,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo_shadow.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'One Bonfire - One love',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Each Bonfire has its own topic of discussion to keep it warm and tight!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 23.0),
                    child: Material(
                      color: Theme
                          .of(context)
                          .accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()
                              ),
                              ModalRoute.withName("home")
                          );
                        },
                        minWidth: 150.0,
                        height: 42.0,
                        child: Text(
                          'DONE',
                          style: TextStyle(
                              letterSpacing: 0.3,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
