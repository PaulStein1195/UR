import 'package:bonfire_newbonfire/widget/trends_showmore.dart';
import 'package:flutter/material.dart';

class WH_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("What's Happening", style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(41, 39, 40, 200.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0,),

            Trends_Detailed("https://picsum.photos/250?image=11", "Technology",
                "Create a Start up in SV"),
            SizedBox(height: 10.0,),
            Trends_Detailed("https://picsum.photos/250?image=11", "Technology",
                "Create a Start up in SV"),
            SizedBox(height: 10.0,),
            Trends_Detailed("https://picsum.photos/250?image=11", "Technology",
                "Create a Start up in SV"),
            SizedBox(height: 10.0,),

            Trends_Detailed("https://picsum.photos/250?image=11", "Technology",
                "Create a Start up in SV"),
            SizedBox(height: 10.0,),

            Trends_Detailed("https://picsum.photos/250?image=11", "Technology",
                "Create a Start up in SV"),
            SizedBox(height: 10.0,),

          ],
        ),
      ),
    );
  }
}
