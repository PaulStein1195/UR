import 'package:flutter/material.dart';

class QuestionTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 39, 40, 200.0),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "ask"),
                    child: CircleAvatar(
                      backgroundColor: Color(0XFF333333),
                      //Theme.of(context).accentColor,
                      radius: 50.0,
                      child: Icon(
                        Icons.help_outline,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "ASK",
                    style: TextStyle(color: Colors.white70, fontSize: 25.0),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "survey"),
                    child: CircleAvatar(
                      backgroundColor: Color(0XFF333333),
                      //Theme.of(context).accentColor,
                      radius: 50.0,
                      child: Icon(
                        Icons.people,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "SURVEY",
                    style: TextStyle(color: Colors.white70, fontSize: 25.0),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
