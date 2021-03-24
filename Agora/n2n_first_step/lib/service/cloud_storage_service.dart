import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageService {
  static CloudStorageService instance = CloudStorageService();

  //Variable declaration
  FirebaseStorage _storage;
  StorageReference _baseRef;
  String _profileImages = "profile_images";

  CloudStorageService() {
    //Instantiate the services
    _storage = FirebaseStorage.instance;
    _baseRef = _storage.ref();
  }

  Future<StorageTaskSnapshot> uploadUserImage(String _uid, File _imageFile) {
    try {
      return _baseRef
          .child(_uid)
          .child(_profileImages)
          .putFile(_imageFile)
          .onComplete;

    } catch(e) {
      print(e);
    }
  }
}
