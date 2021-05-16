import 'package:flutter/material.dart';

Widget Avatar_Widget(BuildContext context,
    {IconData icon, String text, Function onTap, Color color1, Color color2}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            gradient: LinearGradient(colors: [
              //Theme.of(context).accentColor,
              color1,
              color2
            ],
                begin: Alignment.topLeft, end: Alignment.bottomLeft

            ),
            color: Colors.white, //Theme.of(context).accentColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                gradient: LinearGradient(colors: [
                  color1,
                  color2
                ],
                    begin: Alignment.topLeft, end: Alignment.bottomLeft

                ),
                image: DecorationImage(
                    image: AssetImage("assets/images/flame_icon1.png")),
                color: Colors.white70, //Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
      Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 22.5),
      ),
    ],
  );
}
