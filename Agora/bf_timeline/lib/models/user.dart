import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String email;
  String profileImage;
  String bio;
  List bonfires;
  //final List<Message> messages;
  Timestamp accountCreated;


  User({this.uid, this.name, this.email, this.profileImage, this.bio, this.bonfires, this.accountCreated});
}