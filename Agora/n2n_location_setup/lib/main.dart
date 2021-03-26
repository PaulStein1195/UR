import 'package:flutter/material.dart';
import 'package:n2n_location_setup/screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LocationScreen(),
    );
  }
}
