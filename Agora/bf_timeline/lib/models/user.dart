import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String email;
  String profileImage;
  String bio;
  Timestamp accountCreated;


  User({this.uid, this.name, this.email, this.profileImage, this.bio, this.accountCreated});
}