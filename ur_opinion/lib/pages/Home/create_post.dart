import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ur_opinion/home.dart';

class Create_Post extends StatefulWidget {
  @override
  _Create_PostState createState() => _Create_PostState();
}

class _Create_PostState extends State<Create_Post> {
  double _height;
  double _width;
  String url;
  final _formKey = new GlobalKey<FormState>();
  List<bool> categoryState = [false, false, false, false];

  bool isSubmitted = false; //Initialize the state of submitted of the new post

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController solutionController = TextEditingController();

  /*void saveToDatabase() async {
    firestoreInstance
        .collection("Posts")
        .document(_auth.user.uid)
        .collection("userPosts")
        .document()
        .setData({
      //"username":_auth.user,
      "title": titleController.text,
      "description": descriptionController.text,
      "solution": solutionController.text,
      "userId": _auth.user.uid
    }).then((value) {
      print("Success");
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          title: Text(
            "Create Post",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            alignment: Alignment.topCenter,
            child: postPageUI(),
          ),
        ));
  }

  Widget postPageUI() {
    return Builder(
      builder: (BuildContext _context) {
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
                  _postItContentUI(),
                  _smartContentSpace(),
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
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return new MyHomePage();
      }));
    }
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
            _smartIcon(
                Icons.add_a_photo, Theme.of(context).primaryColor, "btnCamera"),
            _smartIcon(
              Icons.add_photo_alternate,
              Theme.of(context).primaryColor,
              "btnImage",
            ),
            //_smartIcon(Icons.share, Color(0xFF10ac84), "btnShare", () {}),
            //_smartIcon(Icons.computer, Color(0xFF10ac84), "btnAI", () {}),
          ],
        ),
      ),
    );
  }

  Widget _smartIcon(
    IconData icon,
    Color color,
    String heroTag,
  ) {
    return Container(
      height: 45.0,
      width: 60.0,
      child: FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: color,
        onPressed: () {},
        child: Icon(
          icon,
          color: Colors.grey.shade600,
        ),
      ),
    );
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
              labelText: "Describe your post",
              labelStyle: TextStyle(fontSize: 15, fontFamily: "PT-Sans")),
        ),
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
          onPressed: () {},
          color: Colors.grey.shade600,
          child: Text(
            "Post",
            style: TextStyle(
                fontSize: 17.5,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
