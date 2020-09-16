import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {

  double _width;
  double _height;

  DashboardPage(this._width, this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
    );
  }
}
