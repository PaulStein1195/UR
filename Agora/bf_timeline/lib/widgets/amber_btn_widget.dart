import 'package:flutter/material.dart';

Widget Amber_Btn_Widget(
    {BuildContext context, String text, Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 120.0),
    child: Material(
      color: Colors.blueAccent,//color: Colors.orange.shade600,//Theme.of(context).accentColor,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      elevation: 3.0,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 300.0,
        height: 42.0,
        child: Text(
          text,
          style: TextStyle(
              letterSpacing: 0.3,
              fontSize: 17.5,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    ),
  );
}


