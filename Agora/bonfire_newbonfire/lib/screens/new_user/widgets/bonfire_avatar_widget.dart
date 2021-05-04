import 'package:flutter/material.dart';

Widget Avatar_Widget({IconData icon, String text, Function onTap}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Color(0XFF333333),
          //Theme.of(context).accentColor,
          radius: 50.0,
          child: Icon(
            icon,
            size: 40.0,
            color: Colors.white,
          ),
        ),
      ),
      Text(
        text,
        style: TextStyle(color: Colors.white70, fontSize: 25.0),
      ),
    ],
  );
}