import 'package:firebase_auth/firebase_auth.dart';
import 'package:map_fire/providers/firebase_methods.dart';

class FirebaseRepo {

  static final FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();
  Future<FirebaseUser> googleSignIn() => _firebaseMethods.googleSignIn();
  Future<bool> authenticateUser(FirebaseUser user) => _firebaseMethods.authenticateUser(user);
  Future<void> addDataToDB(FirebaseUser user) => _firebaseMethods.addDataToDB(user);


}