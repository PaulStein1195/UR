import 'package:flutter/material.dart';
import 'package:n2n_home/const/color_pallete.dart';
import 'package:n2n_home/screens/timeline_screen.dart';

class StatScreen extends StatefulWidget {
  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed:() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Timeline())),
          icon: Icon(Icons.arrow_back, color: kBelongMarineBlue,),
        ),
        title: Text(
          "Stats",
          style: TextStyle(color: kBelongMarineBlue),
        ),
      ),
    );
  }
}
