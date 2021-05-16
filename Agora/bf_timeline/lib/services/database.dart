import 'package:bf_timeline/models/bonfire.dart';
import 'package:bf_timeline/models/bonfire_model.dart';
import 'package:bf_timeline/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser(User user) async {
    String retVal = "error";
    try {
      await _firestore.collection("Users").document(user.uid).setData({
        'name': user.name,
        'email': user.email,
        "profileImage": user.profileImage,
        "bio": "",
        'accountCreated': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<void> createUserInDB(String _uid, String _name, String _email,
      String _bio) async {
    try {
      return await _firestore.collection("Users").document(_uid).setData({
        'name': _name,
        'email': _email,
        "profileImage": "",
        "bio": "",
        'accountCreated': Timestamp.now(),
      });
    } catch (error) {
      print(error);
    }
  }
  Future<void> createBonfire(String bonfire, String uid, String bfColl,
      String bf_id, List<String> bonfires) async {
    return await _firestore
        .collection(bonfire)
        .document(uid)
        .collection(bfColl)
        .document(bf_id)
        .setData(
      {"bonfire": bonfires},
    );
  }

  Future<User> getUserData(String uid) async {
    User _retVale = User();
    try {
      DocumentSnapshot _doc =
      await _firestore.collection("Users").document(uid).get();
      _retVale.uid = uid;
      _retVale.name = _doc["name"];
      _retVale.email = _doc["email"];
      _retVale.profileImage = _doc["profileImage"];
      _retVale.bio = _doc["bio"];
      _retVale.accountCreated = _doc["accountCreated"];
    } catch (e) {}
    return _retVale;
  }

  Stream<Conversation> getConversation(String _conversationID) {
    var _ref = _firestore.collection("usersBonfire").document(_conversationID);
    return _ref.snapshots().map(
          (_doc) {
        return Conversation.fromFirestore(_doc);
      },
    );
  }

  Stream<List<User>> getUsersInDB() {
    var _ref = _firestore
        .collection("Users");
    return _ref.getDocuments().asStream().map((_snapshot) {
      return _snapshot.documents.map((_doc) {
        return User.fromDocument(_doc);
      }).toList();
    });
  }

  Stream<List<BonfireModel>> getBonfiresInDB(String bonfire, String uid,
      String usersBonfire) {
    var _ref = _firestore.collection(bonfire).document(uid).collection(usersBonfire);
    return _ref.getDocuments().asStream().map((_snapshot) {
      return _snapshot.documents.map((_doc) {
        return BonfireModel.fromDocument(_doc);
      }).toList();
    });
  }

}
