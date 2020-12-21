import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:small_postit/models/user.dart';
import 'package:small_postit/models/post.dart';
import 'package:small_postit/providers/auth_provider.dart';


class AgoraPage extends StatelessWidget {
  AuthProvider _auth;

  @override
  Widget build(BuildContext _context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("Posts")
            .document("xbM0yFPABdRnbGeUIkbom73kHH33")
            .collection("userPosts")
            .snapshots(),
        builder: (_context, snapshot) {
          if (!snapshot.hasData)
            return new SpinKitFoldingCube(
              color: Colors.amber,
              size: 50.0,
            );
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (_context, index) {
              DocumentSnapshot _ds = snapshot.data.documents[index];
              return Stack(
                overflow: Overflow.visible,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: MediaQuery.of(_context).size.height * 0.55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.dstATop),
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://picsum.photos/250?image=9"),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 50,
                              blurRadius: 20,
                              offset: Offset(0, 6),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  _userDataInfo(_context, _ds),
                                  _postCategory(_context),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(14, 170, 10, 5),
                              child: _postExplanationData(_context, _ds),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      left: MediaQuery.of(_context).size.width * 0.075,
                      child: _socialInfoContainer(_context, _ds))
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _postCategory(BuildContext _context) {
    return Column(
      children: [
        Container(
          height: 30.0,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0XFF00d1ff),
          ),
          child: Center(
            child: Text(
              "TEAM",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFfffbe0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _userDataInfo(BuildContext _context, DocumentSnapshot ds) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              fit: BoxFit.cover, 
              image: NetworkImage("https://picsum.photos/250?image=11"),
            ),
            border:
            Border.all(color: Theme.of(_context).accentColor, width: 2.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Steve",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "3 hours ago",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _postExplanationData(BuildContext _context, DocumentSnapshot ds) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(_context).size.width * 0.5,
          child: Text(
            ds["title"],
            maxLines: 2,
            style: TextStyle(
                fontSize: 19.5,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Divider(
          thickness: 1.0,
          color: Colors.white,
        ),
        Container(
          width: MediaQuery.of(_context).size.width * 0.5,
          child: Text(
            ds["description"],
            maxLines: 2,
            style: TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _socialInfoContainer(BuildContext _context, DocumentSnapshot _ds) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.075,
      width: MediaQuery.of(_context).size.width * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(
                Icons.hearing,
                color: Theme.of(_context).primaryColor.withOpacity(0.4),
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Theme.of(_context).primaryColor),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.comment,
                color: Theme.of(_context).primaryColor.withOpacity(0.4),
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Theme.of(_context).primaryColor),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.share,
                color: Theme.of(_context).primaryColor.withOpacity(0.4),
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Theme.of(_context).primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
