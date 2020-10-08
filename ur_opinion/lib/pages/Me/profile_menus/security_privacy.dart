import 'package:flutter/material.dart';

class Security_Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Security & Privacy"),
      ),
    );
  }
}