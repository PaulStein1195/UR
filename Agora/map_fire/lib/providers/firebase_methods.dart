import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:map_fire/models/user.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User user = User();

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    print("EMAIL ID : ${currentUser.email}");
    return currentUser;
  }

  Future<FirebaseUser> googleSignIn() async {
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication =
        await _signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: _signInAuthentication.idToken,
        accessToken: _signInAuthentication.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser user = result.user;
    return user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot results = await _firestore
        .collection("Users")
        .where("email", isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = results.documents;
    //if list > 0 = user exists else "new user"
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDB(FirebaseUser currentUser) async {
    user = User(
      uid: currentUser.uid,
      name: currentUser.displayName,
      email: currentUser.email,
      profilePhoto: currentUser.photoUrl,
    );

    _firestore
        .collection("Users")
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }

  Future<void> updateUser(
      FirebaseUser currentUser, double lat, double long) async {
    _firestore
        .collection("Users")
        .document(currentUser.uid)
        .updateData({
          "location": {"lat": lat, "long": long}
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<User> retrieveUserDetails(FirebaseUser user) async {
    DocumentSnapshot _documentSnapshot =
    await _firestore.collection("users").document(user.uid).get();
    return User.fromMap(_documentSnapshot.data);
  }


}
