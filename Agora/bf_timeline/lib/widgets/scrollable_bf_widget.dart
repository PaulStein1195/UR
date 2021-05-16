import 'package:flutter/material.dart';

class Scrollable_BF_Widget extends StatelessWidget {
  //String teamsImage, teamsTitle, teamsGoal, teamsMemebers;

  //Teams(this.teamsImage, this.teamsTitle, this.teamsGoal, this.teamsMemebers);

  /*List<_FeaturePhoto> _feature() {
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
  }*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(0, 2, 10, 5),
        child: Row(
          children: [
            BonfiresOptions("Software Programming", "Anything"),
            BonfiresOptions("Memes", "Design"),
            BonfiresOptions("Education", "Biology"),
            BonfiresOptions("Travel", "Lenguages"),
          ],
        ) /*_feature().map<Widget> ( (photo) {
              return _FeatureGridItem(featurePhoto: photo);//Feature(photo);
            }).toList()*/
        );
  }
}

Widget BonfiresOptions(String _bfname1, String _bfname2) {
  return Column(
    children: [
      BonfireCategory(_bfname1, Colors.amber, Colors.orange.shade600),
      SizedBox(
        height: 2.0,
      ),
      BonfireCategory(_bfname2, Colors.lightBlueAccent, Colors.lightBlue),
      SizedBox(
        height: 2.0,
      ),
      BonfireCategory(_bfname2, Colors.lightGreenAccent, Colors.lightGreen.shade600),

    ],
  );
}

Widget BonfireCategory(String _bf_name, Color color1, Color color2) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color(0XFF333333), //Color.fromRGBO(41, 39, 40, 140.0),
              border: Border.all(
                color: Color(0XFF717171),
              )),
          height: 55.0,
          width: 250.0,
          child: Row(
            children: [
              SizedBox(width: 5.0,),
              Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: LinearGradient(colors: [
                    //Theme.of(context).accentColor,
                    color1,
                    color2
                  ],
                      begin: Alignment.topLeft, end: Alignment.bottomLeft

                  ),
                  color: Colors.white, //Theme.of(context).accentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(colors: [
                        color1,
                        color2
                      ],
                          begin: Alignment.topLeft, end: Alignment.bottomLeft

                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/images/flame_icon1.png")),
                      color: Colors.white70, //Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.0,),

              Flexible(
                child: Container(
                  child: Text(
                    _bf_name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,

                    //softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
