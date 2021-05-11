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
        "bonfires": {},
        'accountCreated': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<User> getUserData(String uid) async {
    User _retVale = User();
    try {
      DocumentSnapshot _doc = await _firestore.collection("Users").document(uid).get();
      _retVale.uid = uid;
      _retVale.name = _doc["name"];
      _retVale.email = _doc["email"];
      _retVale.profileImage = _doc["profileImage"];
      _retVale.bio = _doc["bio"];
      _retVale.accountCreated = _doc["accountCreated"];

    } catch(e){

    }
    return _retVale;
  }
}
