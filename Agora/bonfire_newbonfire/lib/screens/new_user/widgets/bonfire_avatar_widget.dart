import 'package:flutter/material.dart';

Widget Avatar_Widget(BuildContext context,
    {IconData icon, String text, Function onTap, String image}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            /*image: DecorationImage(
                image: AssetImage("assets/images/$image.png")
              ),*/
            color: Colors.white, //Theme.of(context).accentColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                    image: AssetImage("assets/images/$image.png")),
                color: Colors.white70, //Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
      Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    ],
  );
}
