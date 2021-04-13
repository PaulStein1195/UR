import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackBarService {
  BuildContext _buildContext;

  static SnackBarService instance = SnackBarService();

  SnackBarService() {}

  set buildContext(BuildContext _context) {
    _buildContext = _context;
  }

  void showSnackBarError(String _message) {
    Scaffold.of(_buildContext).showSnackBar(
      SnackBar(
        content: Text(
          _message,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showSnackBarSuccess(String _message) {
    Scaffold.of(_buildContext).showSnackBar(
      SnackBar(
        content: Text(
          _message,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
