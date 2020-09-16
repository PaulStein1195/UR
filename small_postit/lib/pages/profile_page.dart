import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../providers/auth_provider.dart';

import '../services/db_service.dart';

import '../models/user.dart';

class ProfilePage extends StatelessWidget {
  final double _height;
  final double _width;

  AuthProvider _auth;

  ProfilePage(this._height, this._width);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: _height,
      width: _width,
      child: ChangeNotifierProvider<AuthProvider>.value(
        value: AuthProvider.instance,
        child: _profilePageUI(),
      ),
    );
  }

  Widget _profilePageUI() {
    return Builder(
      builder: (BuildContext _context) {
        _auth = Provider.of<AuthProvider>(_context);
        return StreamBuilder<User>(
          stream: DBService.instance.getUserData(_auth.user.uid),
          builder: (_context, _snapshot) {
            var _userData = _snapshot.data;
            return _snapshot.hasData
                ? Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: _height * 0.50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _userImageWidget(_userData.image),
                          _userNameWidget(_userData.name),
                          _userEmailWidget(_userData.email),
                          _logoutButton(_context),
                        ],
                      ),
                    ),
                  )
                : SpinKitFoldingCube(
                    color: Color(0xFF2994b2),
                    size: 50.0,
                  );
          },
        );
      },
    );
  }

  Widget _userImageWidget(String _image) {
    double _imageRadius = _height * 0.20;
    return Container(
      height: _imageRadius,
      width: _imageRadius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_imageRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(_image),
        ),
      ),
    );
  }

  Widget _userNameWidget(String _userName) {
    return Container(
      height: _height * 0.05,
      width: _width,
      child: Text(
        _userName,
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xFF222f3e), fontSize: 30, fontFamily: "PT-Sans"),
      ),
    );
  }

  Widget _userEmailWidget(String _email) {
    return Container(
      height: _height * 0.03,
      width: _width,
      child: Text(
        _email,
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0XFF576574), fontSize: 15, fontFamily: "PT-Sans"),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return Container(
      height: _height * 0.06,
      width: _width * 0.40,
      child: MaterialButton(
        onPressed: () {
          _auth.logoutUser(() {});
        },
        color: Theme.of(context).buttonColor,
        child: Text(
          "LOGOUT",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: "PT-Sans", color: Colors.white),
        ),
      ),
    );
  }
}
