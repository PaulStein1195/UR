import 'package:flutter/material.dart';

class cardGenderContent extends StatelessWidget {
  final String gender;
  final IconData icon;

  cardGenderContent({@required this.icon, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          gender,
          style: TextStyle(color: Color(0XFF8D8E98), fontSize: 18.0),
        )
      ],
    );
  }
}