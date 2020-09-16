import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:small_postit/pages/main_home_page.dart';
import 'package:small_postit/services/db_service.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import "../models/user.dart";

final firestoreInstance = Firestore.instance;

class CreatePostPage extends StatefulWidget {




  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  double _height;
  double _width;
  String postId = Uuid().v4();
  AuthProvider _auth;
  File file;
  String url;

  final _formKey = new GlobalKey<FormState>();
  List<bool> categoryState = [false, false, false, false];

  bool isSubmitted = false; //Initialize the state of submitted of the new post

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController solutionController = TextEditingController();

  void saveToDatabase() async {
    firestoreInstance
        .collection("Posts")
        .document(_auth.user.uid)
        .collection("userPosts")
        .document()
        .setData({
      "username":_auth.user,
      "title": titleController.text,
      "description": descriptionController.text,
      "solution": solutionController.text,
      "userId": _auth.user.uid
    }).then((value) {
      print("Success");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
          centerTitle: true,
          title: Text(
            "Create Post",
            style: TextStyle(color: Theme
                .of(context)
                .primaryColor),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: postPageUI(),),
        )
    );
  }

  Widget postPageUI() {
    return Builder(
      builder: (BuildContext _context) {
        _auth = Provider.of<AuthProvider>(_context);
        return ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _postCategory(),
                  _postItContentUI(),
                  _smartContentSpace(),
                  _addContentDisplayUI(),
                  _submitPostButton(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
    uploadStatus();
  }

  void uploadStatus() async {
    if (validateAndSave()) {
      saveToDatabase();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return new Main_Home();
      }));
    }
  }

  handleTakePhoto() async {
    File file = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 400,
      maxWidth: 500,
    );
    setState(() {
      this.file = file;
    });
  }

  //Same as handleTakePhoto but getting it from phone gallery
  handleChooseFromGallery() async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = file;
    });
  }

  Widget _smartContentSpace() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
      child: Container(
        width: _width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _smartIcon(Icons.add_a_photo, Theme
                .of(context)
                .primaryColor,
                "btnCamera", handleTakePhoto),
            _smartIcon(
                Icons.add_photo_alternate,
                Theme
                    .of(context)
                    .primaryColor,
                "btnImage",
                handleChooseFromGallery),
            //_smartIcon(Icons.share, Color(0xFF10ac84), "btnShare", () {}),
            //_smartIcon(Icons.computer, Color(0xFF10ac84), "btnAI", () {}),
          ],
        ),
      ),
    );
  }

  Widget _postCategory() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 70.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50.0,
                width: 80,
                child: new RaisedButton(
                    child: new Text(
                      'TEAM',
                      style: TextStyle(fontFamily: "PT-Sans"),
                    ),
                    textColor: categoryState[0]
                        ? Colors.white
                        : Theme
                        .of(context)
                        .primaryColor,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    color: categoryState[0]
                        ? Color(0XFF00d1ff)
                        : Color(0xFFfffbe0),
                    onPressed: () {
                      setState(() {
                        categoryState[0] = !categoryState[0];
                        print(categoryState[0]);
                      });
                    }),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 50.0,
                width: 100,
                child: new RaisedButton(
                    child: new Text(
                      'PROJECT',
                      style: TextStyle(fontFamily: "PT-Sans"),
                    ),
                    textColor: categoryState[1]
                        ? Colors.white
                        : Theme
                        .of(context)
                        .primaryColor,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    color: categoryState[1]
                        ? Color(0XFF52d681)
                        : Color(0xFFfffbe0),
                    onPressed: () {
                      setState(() {
                        categoryState[1] = !categoryState[1];
                        print(categoryState[1]);
                      });
                    }),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 50.0,
                width: 80,
                child: new RaisedButton(
                    child: new Text(
                      'IDEA',
                      style: TextStyle(fontFamily: "PT-Sans"),
                    ),
                    textColor: categoryState[2]
                        ? Colors.white
                        : Theme
                        .of(context)
                        .primaryColor,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    color: categoryState[2]
                        ? Color(0XFFffc300)
                        : Color(0xFFfffbe0),
                    onPressed: () {
                      setState(() {
                        categoryState[2] = !categoryState[2];
                        print(categoryState[2]);
                      });
                    }),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 50.0,
                width: 100,
                child: new RaisedButton(
                    child: new Text(
                      'IMPROVE',
                      style: TextStyle(fontFamily: "PT-Sans"),
                    ),
                    textColor: categoryState[3]
                        ? Colors.white
                        : Theme
                        .of(context)
                        .primaryColor,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    color: categoryState[3]
                        ? Color(0XFFa40a3c)
                        : Color(0xFFfffbe0),
                    onPressed: () {
                      setState(() {
                        categoryState[3] = !categoryState[3];
                        print(categoryState[3]);
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _smartIcon(IconData icon, Color color, String heroTag,
      Function onPressed) {
    return Container(
      height: 45.0,
      width: 60.0,
      child: FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: color,
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.yellow.shade50,
        ),
      ),
    );
  }

  Widget _contentSpace() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Container(
        height: 200.0,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.9,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(file),
                )),
          ),
        ),
      ),
    );
  }

  Widget _addContentDisplayUI() {
    return file == null ? Text("") : _contentSpace();
  }

  Widget _postItContentUI() {
    return Container(
        width: _width,
        child: Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState.save();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              _titleTextField(),
              _descriptionTextField(),
              _solutionTextField(),
            ],
          ),
        ));
  }

  Widget _titleTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: _width,
        child: TextFormField(
          validator: (_input) {
            return _input.isEmpty ? "Need to title your Post" : null;
          },
          onSaved: (_input) {
            return _input = _input;
          },
          controller: titleController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Title your post",
              labelStyle: TextStyle(fontSize: 15, fontFamily: "PT-Sans")),
        ),
      ),
    );
  }

  Widget _descriptionTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: _width,
        child: TextFormField(
          validator: (_input) {
            return _input.isEmpty ? "Need to describe briefly your Post" : null;
          },
          onSaved: (_input) {
            return _input = _input;
          },
          minLines: 2,
          maxLines: 4,
          controller: descriptionController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Describe it",
              labelStyle: TextStyle(fontSize: 15, fontFamily: "PT-Sans")),
        ),
      ),
    );
  }

  Widget _solutionTextField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      width: _width,
      child: TextFormField(
        validator: (_input) {
          return _input.isEmpty ? "Need to add your solution" : null;
        },
        onSaved: (_input) {
          return _input = _input;
        },
        minLines: 2,
        maxLines: 4,
        controller: solutionController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Suggest solution",
            labelStyle: TextStyle(fontSize: 15, fontFamily: "PT-Sans")),
      ),
    );
  }

  Widget _submitPostButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        height: 45,
        width: 100,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          onPressed: () {
            uploadStatus();
          },
          color: Theme
              .of(context)
              .buttonColor,
          child: Text(
            "Post",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "PT-Sans",
                color: Colors.yellow.shade50),
          ),
        ),
      ),
    );
  }
}
