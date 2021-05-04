import 'package:bonfire_newbonfire/screens/display_post_page.dart';
import 'package:bonfire_newbonfire/screens/home_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You are all set!", style: TextStyle(fontSize: 35.0, color: Colors.white70),),
          //Text(),
          SizedBox(height: 50.0,),
          Amber_Btn_Widget(context: context, text: "DONE", onPressed: () {

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              ModalRoute.withName("home"),
            );
          },)
        ],
      ),
    );
  }
}
