import 'package:flutter/material.dart';

class Health extends StatefulWidget {
  final String bonfire;

  Health({this.bonfire});

  @override
  _HealthState createState() => _HealthState(
    bonfire: this.bonfire,
  );
}

class _HealthState extends State<Health> {
  final String bonfire;

  _HealthState({this.bonfire});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Text("Technology"),
        ),
      ),
    );
  }
}
