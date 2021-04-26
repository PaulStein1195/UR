import 'package:flutter/material.dart';

Widget Choose_B_Widget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Color(0XFF333333),
border: Border.all(color: Colors.grey.shade700)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Flexible(
          child: Column(
            children: [
              Text(
                "Choose Bonfires!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              Text(
                "Start connecting with bonfires that you have interest",
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12.0,
              ),
              Material(
                color: Color(0XFFffb21a),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: MaterialButton(
                  elevation: 5.0,
                  onPressed: () {},
                  child: Text(
                    "START",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
