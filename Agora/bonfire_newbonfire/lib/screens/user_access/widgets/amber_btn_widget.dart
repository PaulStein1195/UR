import 'package:flutter/material.dart';

Widget Amber_Btn_Widget(
    {BuildContext context, String text, Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 120.0),
    child: Material(
      color: Theme.of(context).accentColor,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 150.0,
        height: 42.0,
        child: Text(
          text,
          style: TextStyle(
              letterSpacing: 0.3,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    ),
  );
}

