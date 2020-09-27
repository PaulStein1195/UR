import 'package:flutter/material.dart';
import '../models/posts.dart';

/*class PostCard extends StatelessWidget {
  final _width;
  final _height;
  final List<Posts> _postsData;

  PostCard(this._width, this._height, this._postsData);

  @override
  Widget build(BuildContext _context) {
    return Container(
      height: _height,
      child: ListView(
        children: _postsData.map((_posts) {
          return Stack(
            overflow: Overflow.visible,
            children: [
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(_context).size.height * 0.52,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.dstATop),
                              fit: BoxFit.cover,
                              image: NetworkImage(_posts.image),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 10,
                                blurRadius: 8,
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 20, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  _posts.usersImage),
                                            ),
                                            border: Border.all(
                                                color: Theme.of(_context)
                                                    .accentColor,
                                                width: 2.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 7.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _posts.username,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                _posts.timestamp,
                                                style: TextStyle(
                                                    color: Colors.white54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 30.0,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade100
                                              //color: Color(0XFF00d1ff),
                                              ),
                                          child: Center(
                                            child: Text(
                                              _posts.category,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black
                                                  //color: Color(0xFFfffbe0),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(12, 190, 10, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(_context).size.width *
                                              0.5,
                                      child: Text(
                                        _posts.title,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(_context).size.width *
                                              0.9,
                                      child: Text(
                                        _posts.description,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Paul",
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                left: MediaQuery.of(_context).size.width * 0.047,
                child: _socialInfoContainer(_context),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _socialInfoContainer(BuildContext _context) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.085,
      width: MediaQuery.of(_context).size.width * 0.906,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color: Colors.grey.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(
                Icons.hearing,
                color: Colors.grey.shade700,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.comment,
                color: Colors.grey.shade700,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.share,
                color: Colors.grey.shade700,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/