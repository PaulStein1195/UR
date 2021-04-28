import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String bio;
  final String image;

  final Timestamp lastSeen;

  User({this.id, this.name, this.email, this.image, this.bio, this.lastSeen});

  factory User.fromDocument(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;
    return User(
      id: _snapshot.documentID,
      name: _data["name"],
      email: _data["email"],
      image: _data["image"],
      bio: _data["bio"],
      lastSeen: _data["lastSeen"],
    );
  }
}
