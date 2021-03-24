import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:n2n_first_step/screens/confirmation_email.dart';
import 'package:n2n_first_step/screens/loading_screen.dart';
import 'package:n2n_first_step/service/navigation_service.dart';
import 'package:n2n_first_step/service/snackbar_service.dart';

enum AuthStatus {
  NotAuthenticated,
  Authenticating,
  Authenticated,
  UserNotFound,
  Error,
}

//Creating a class to host all the AuthProvider functionality
class AuthProvider extends ChangeNotifier {
  FirebaseUser user;
  AuthStatus status;
  FirebaseAuth _auth; //Internal variable to call firebase auth
  static AuthProvider instance = AuthProvider(); //Create static member of our class to only allow one AuthProvider

  AuthProvider() {
    _auth = FirebaseAuth.instance;
  }

  //Functions of our class
  void loginUserWithEmailAndPassword(String _email, String _password) async {
    status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      AuthResult _result = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      user = _result.user;
      status = AuthStatus.Authenticated;
      SnackBarService.instance.showSnackBarSuccess("Welcome ${user.email}");
      //TODO: Update lastSeen
      NavigationService.instance.navigateToReplacement(LoadingScreen.id);
    } catch (error) {
      status = AuthStatus.Error;
      //Display an error
      user = null;
      SnackBarService.instance.showSnackBarError("Error Authenticating");

    }
    notifyListeners();

  }

  void registerUserWithEmailAndPassword(String _email, String _password, Future<void> onSuccess(String _uid)) async {
    status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      AuthResult _result = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      user = _result.user;
      status = AuthStatus.Authenticated;
      await onSuccess(user.uid);
      SnackBarService.instance.showSnackBarSuccess("Signed in successfully");
      user.sendEmailVerification();
      NavigationService.instance.navigateToReplacement(EmailVerification.id);
      //NavigationService.instance.goBack();
      //NavigationService.instance.navigateToReplacement(LoadingScreen.id);

    } catch(error) {
      status = AuthStatus.Error;
      user = null;
      SnackBarService.instance.showSnackBarError("Error while registering user");
    }
    notifyListeners();
  }


}
