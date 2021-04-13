import 'package:bonfire_newbonfire/models/post.dart';
import 'package:bonfire_newbonfire/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DBService {
  static DBService instance = DBService();
  Firestore _db;

  DBService() {
    _db = Firestore.instance;
  }

    String _userCollection = "Users";
  String _postsCollection = "Posts";

  Future<void> createPostInDB(
      String _uid,
      String _postId,
      String _image,
      String _title,
      String _description,
      String _solution,
      String _mediaUrl,
      ) async {
    try {
      return await _db
          .collection(_postsCollection)
          .document(_uid)
          .collection("userPosts")
          .document(_postId)
          .setData({
        "postId": _postId,
        "ownerId": _uid,
        "image": _image,
        "title": _title,
        "description": _description,
        "solution": _solution,
        "mediaUrl": _mediaUrl,
        "timestamp": Timestamp.now(),
        "likes": {},
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> createUserInDB(
      String _uid, String _name, String _email, String _imageURL) async {
    try {
      return await _db.collection(_userCollection).document(_uid).setData({
        "name": _name,
        "email": _email,
        "image": _imageURL,
        "lastSeen": DateTime.now().toUtc(),
      });
    } catch (error) {
      print(error);
    }
  }

  Stream<User> getUserData(String _userID) {
    var _ref = _db.collection(_userCollection).document(_userID);
    return _ref.get().asStream().map((_snapshot) {
      return User.fromDocument(_snapshot);
    });
  }

  Stream<List<Post>> getPostsInDB(String _userID) {
    var _ref = _db
        .collection(_postsCollection)
        .document(_userID)
        .collection("userPosts").orderBy("timestamp", descending: true);
    return _ref.snapshots().map((_snapshot) {
      return _snapshot.documents.map((_doc) {
        return Post.fromFirestore(_doc);
      }).toList();
    });
  }
}
