import 'package:flutter/material.dart';

class Teams extends StatelessWidget {
  String teamsImage, teamsTitle, teamsGoal, teamsMemebers;

  //Teams(this.teamsImage, this.teamsTitle, this.teamsGoal, this.teamsMemebers);

  List<_FeaturePhoto> _feature() {
    return [
      _FeaturePhoto(
          imageURL: 'https://picsum.photos/250?image=36',
          title: 'Create the CMS of the vehicle',
          subtitle: '9 members',
          featureString: 'CMS'),
      _FeaturePhoto(
          imageURL: 'https://picsum.photos/250?image=20',
          title: 'Writing embedded system code',
          subtitle: '15 members',
          featureString: 'Software'),
      _FeaturePhoto(
          imageURL:
              'https://cdn.pixabay.com/photo/2011/09/27/18/52/sparrow-9950_960_720.jpg',
          title: 'The place to know about birds',
          subtitle: '2K members',
          featureString: 'Love birds'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black87,
      height: 210,
      width: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(10, 2, 10, 5),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Card(
                      color: Colors.blue,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 160,
                            height: 175,
                            child: Image.network(
                                'https://picsum.photos/250?image=20'),
                          ),
                          Positioned(
                              top: 4,
                              left: 135,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: Colors.white60,
                                    //Color(0xff0F0F0F),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                      )
                                    ]),
                                child: Center(
                                    child: Icon(
                                  Icons.fiber_manual_record,
                                  color: Colors.red,
                                )),
                              ))
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Card(
                      color: Colors.blue,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 160,
                            height: 175,
                            child: Center(
                              child: Image.network(
                                  'https://picsum.photos/250?image=20'),
                            ),
                          ),
                          Positioned(
                              top: 4,
                              left: 135,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: Colors.white60,
                                    //Color(0xff0F0F0F),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                      )
                                    ]),
                                child: Center(
                                    child: Icon(
                                  Icons.fiber_manual_record,
                                  color: Colors.red,
                                )),
                              ))
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Card(
                      color: Colors.blue,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 160,
                            height: 175,
                            child: Center(
                              child: Image.network(
                                  'https://picsum.photos/250?image=20'),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            left: 135,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: Colors.white60,
                                //Color(0xff0F0F0F),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.fiber_manual_record,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ], /*_feature().map<Widget> ( (photo) {
              return _FeatureGridItem(featurePhoto: photo);//Feature(photo);
            }).toList()*/
      ),
    );
  }
}

class _FeaturePhoto {
  _FeaturePhoto({this.imageURL, this.title, this.subtitle, this.featureString});

  final String imageURL;
  final String title;
  final String subtitle;
  final String featureString;
}

class _FeatureText extends StatelessWidget {
  const _FeatureText(this.text, this.fontSize);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Text(text, style: TextStyle(fontSize: fontSize)),
    );
  }
}

class _FeatureGridItem extends StatelessWidget {
  _FeatureGridItem({Key key, @required this.featurePhoto}) : super(key: key);

  final _FeaturePhoto featurePhoto;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: <Widget>[
                Image.network(featurePhoto.imageURL,
                    width: 230, height: 180, fit: BoxFit.cover),
                Positioned(
                    top: 16,
                    left: 140,
                    child: Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.blue, //Color(0xff0F0F0F),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          featurePhoto.featureString,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            elevation: 3,
            margin: EdgeInsets.all(10),
          ),
          _FeatureText(featurePhoto.title, 16),
          _FeatureText(featurePhoto.subtitle, 12),
        ]);
  }
}
