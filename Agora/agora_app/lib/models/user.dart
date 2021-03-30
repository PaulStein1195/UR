import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String email;
  final String image;
  final Timestamp lastseen;
  final String name;

  User({this.id, this.email, this.name, this.image, this.lastseen});

  factory User.fromDocument(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;
    return User(
      id: _snapshot.documentID,
      lastseen: _data["lastSeen"],
      email: _data["email"],
      name: _data["name"],
      image: _data["image"],
    );
  }
}
