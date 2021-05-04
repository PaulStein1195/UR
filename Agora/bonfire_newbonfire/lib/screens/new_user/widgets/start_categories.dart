import 'package:flutter/material.dart';

Widget Scrollable_Bonfire_Widget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      borderOnForeground: true,
      elevation: 10.0,
      color: Color(0xFF333333),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Flexible(
          child: Column(
            children: [
              Text(
                "Choose Bonfires!",
                style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              Text(
                "Start connecting with bonfires that you have interest",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12.0,
              ),
              Material(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: MaterialButton(
                  elevation: 5.0,
                  onPressed: () {
                    Navigator.pushNamed(context, "bonfire_options");
                  },
                  child: Text(
                    "START",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
