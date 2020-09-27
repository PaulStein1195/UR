import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: CircleAvatar(
                  radius: 55.0,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                  NetworkImage("https://picsum.photos/250?image=3"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}