import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:small_postit/providers/auth_provider.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final postRef = Firestore.instance.collection("Posts");
  AuthProvider _auth;
  List<dynamic> users = [];

  /*@override
  void initState() {
    super.initState();
    //getPosts();
  }*/

  /*SYNC CALL OF THE DATA SNAPSHOT*/
  /*getPosts() {
    postRef
        .document("SWAZVCGJOrXqzjjwRxG0") //USERID
        .collection("usersPost") //POSTID
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        //For debugging
        print(doc.data);
        print(doc.documentID);
        print(doc.exists);

        //Set state to display the data in our page
        setState(() {
          users = snapshot.documents;
        });



      });
    });
  }*/

  /*ASYNC CALL OF DATA SNAPSHOT*/
  /*DOCUMENTS*/
  /*getPostsAsync() async {
    final DocumentSnapshot doc = await postRef.document("SWAZVCGJOrXqzjjwRxG0").get();
    print(doc.data);
  }*/

  /*ASYNC CALL OF DATA SNAPSHOT*/
  /*COLLECTIONS*/
  /*getPostsAsync() async {
    final QuerySnapshot doc = await postRef.getDocuments();
  }*/

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>.value(
      value: AuthProvider.instance,
      child: DisplayPosts(),
    );
  }

  Widget DisplayPosts() {
    return Builder(
      builder: (BuildContext context) {
        _auth = Provider.of<AuthProvider>(context);
        return Container(
          child: StreamBuilder<QuerySnapshot>(
            //future: We are providing the future that needs to be resolved. Already ASYNC
            stream: postRef
                .document(_auth.user.uid)
                .collection("userPosts")
                .snapshots(),
            //document("SWAZVCGJOrXqzjjwRxG0").collection("usersPost").getDocuments(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (!snapshot.hasData) {
                return new SpinKitFoldingCube(
                  color: Colors.amber,
                  size: 50.0,
                );
              }
              final List<Text> children = snapshot.data.documents
                  .map((doc) => Text(
                    doc["description"]
                        ),)
                  .toList();
              return Container(
                child: ListView(
                  children: children,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
