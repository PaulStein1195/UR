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
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(0, 2, 10, 5),
        children: [
          Row(
            children: [
              BonfiresOptions("Software Programming", "Anything"),
              BonfiresOptions("Memes", "Design"),
              BonfiresOptions("Education", "Biology"),
              BonfiresOptions("Travel", "Lenguages"),
            ],
          )
        ], /*_feature().map<Widget> ( (photo) {
              return _FeatureGridItem(featurePhoto: photo);//Feature(photo);
            }).toList()*/
      ),
    );
  }
}

Widget BonfiresOptions(String _bfname1, String _bfname2) {
  return Column(
    children: [
      BonfireCategory(_bfname1),
      SizedBox(
        height: 10.0,
      ),
      BonfireCategory(_bfname2),
    ],
  );
}

Widget BonfireCategory(String _bf_name) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              //color: Colors.white70,
              border: Border.all(
                color: Color(0XFF717171),
              )),
          height: 50.0,
          width: 200.0,
          child: Center(
            child: Flexible(
              child: Text(
                _bf_name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white70),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
