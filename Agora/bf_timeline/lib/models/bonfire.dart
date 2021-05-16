import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Conversation {
  final String id;
  final List members;
  final List tech;
  final String ownerID;

  Conversation({this.id, this.members, this.tech, this.ownerID});

  factory Conversation.fromFirestore(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;
    List _messages = _data["Nature"];
    if (_messages != null) {
      _messages = _messages.map(
        (_m) {
          return Text("");
        },
      ).toList();
    } else {
      _messages = [];
    }
    return Conversation(
      id: _snapshot.documentID,
      members: _data["Nature"],
      tech: _data["Technology"],
      ownerID: _data["ownerID"],
    );
  }
}
