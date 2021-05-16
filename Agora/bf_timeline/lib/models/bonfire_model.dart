import 'package:cloud_firestore/cloud_firestore.dart';


class BonfireModel {
  String bf_Id;
  List bonfire;

  BonfireModel({this.bf_Id, this.bonfire});

  factory BonfireModel.fromDocument(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;
    return BonfireModel(
      bf_Id: _snapshot.documentID,
      bonfire: _data["bonfire"],


    );
  }
}