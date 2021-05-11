import 'package:bf_timeline/models/user.dart';
import 'package:bf_timeline/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  User _currentUser = User();

  User get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retValue = "error";
    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      _currentUser = await Database().getUserData(_firebaseUser.uid);
      if (_currentUser != null) {
        retValue = "success";
      }
    } on PlatformException catch (e) {
      retValue = e.message;
    } catch(e) {
      print(e);
    }
    return retValue;
  }

  Future<String> registerUser(
      String username, String email, String password) async {
    String retValue = "error";
    User _user = User();
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.name = username;
      String _returnString = await Database().createUser(_user);
      if (_returnString == 'success') {
        retValue = "success";
      }
    } on PlatformException catch (e) {
      retValue = e.message;
    } catch (e) {
      print(e);
    }
    return retValue;
  }

  Future<String> loginUser(String email, String password) async {
    String retValue = "error";
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _currentUser = await Database().getUserData(_authResult.user.uid);
      if (_currentUser != null) {
        retValue = "success";
      }
    } on PlatformException catch (e) {
      retValue = e.message;
    } catch(e) {
      print(e);
    }
    return retValue;
  }

  Future<String> loginGoogleUser() async {
    String retValue = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        "email",
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    User _user = User();
    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      AuthResult _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser) {
        _user.uid = _authResult.user.uid;
        _user.email = _authResult.user.email;
        _user.name = _authResult.user.displayName;
        _user.profileImage = _authResult.user.photoUrl;
        Database().createUser(_user);
      }
      _currentUser = await Database().getUserData(_authResult.user.uid);
      if (_currentUser != null) {
        retValue = "success";
      }
    } on PlatformException catch (e) {
      retValue = e.message;
    } catch (e) {
      print(e);
    }
    return retValue;
  }

  Future<String> logOut() async {
    String retValue = "error";
    try {
      await _auth.signOut();
      _currentUser = User();
      retValue = "success";
    } catch (e) {
      print(e);
    }
    return retValue;
  }
}
