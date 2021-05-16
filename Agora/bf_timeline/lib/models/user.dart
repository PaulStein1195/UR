import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String email;
  String profileImage;
  String bio;
  Timestamp accountCreated;


  User({this.uid, this.name, this.email, this.profileImage, this.bio, this.accountCreated});


  factory User.fromDocument(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;
    return User(
      uid: _snapshot.documentID,
      accountCreated: _data["accountCreated"],
      email: _data["email"],
      name: _data["name"],
      profileImage: _data["profileImage"],
      bio: _data["bio"]
    );
  }
}