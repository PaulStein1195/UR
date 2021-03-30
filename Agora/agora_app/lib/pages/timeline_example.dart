import 'package:agora_app/models/post.dart';
import 'package:agora_app/models/trends.dart';
import 'package:flutter/material.dart';



class Timeline_Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 55.0,
            title: Text("AGORA", style:  TextStyle(color: Colors.white70),),
            automaticallyImplyLeading: false,
            actions: [
              /*Container(
                height: 42.0,
                width: 42.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.grey.shade400,
                    elevation: 0.0,
                    splashColor: Colors.blue,
                    onPressed: () {},
                    child: Icon(
                      MyFlutterApp.mic,
                      size: 30,
                    ),
                  ),
                ),
              ),*/
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                splashColor: Colors.orange,
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    "TEAMS",
                    style: TextStyle(fontSize: 15.5),
                  ),
                ),
              ),
              Divider(
                color: Colors.black87,
              ),
              Teams(),*/
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                child: Text(
                  "TOP 3",
                  style: TextStyle(fontSize: 15.5),
                ),
              ),
              Divider(
                color: Colors.black87,
              ),
              Trends("https://picsum.photos/250?image=2", "COVID-19",
                  "10 days in a row"),
              Trends("https://picsum.photos/250?image=11", "Elections USA",
                  "3 days in a row"),
              Trends("https://picsum.photos/250?image=11", "Elections",
                  "Elections"),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                child: Text(
                  "POSTS (15)",
                  style: TextStyle(fontSize: 15.5),
                ),
              ),
              Divider(
                color: Colors.black87,
              ),
              Posts(
                  "https://picsum.photos/250?image=10",
                  "Paul",
                  "0/0/2020",
                  "GENERAL",
                  "How I manage my time of productivity in this period of pandemic",
                  "https://picsum.photos/250?image=5",
                  "I know that there is a lot of people out there working for long hours at home without...",
                  "50 %",
                  Colors.blue,
                  0.5,
                  true),
              Posts(
                  "https://picsum.photos/250?image=11",
                  "Pablo",
                  "8/0/2020",
                  "JOB / COMPANIES",
                  "Looking for talent",
                  "https://picsum.photos/250?image=10",
                  "Looking for creative people with some experience in software and time to get a freelance job in apps. If interested contact me at 669-000-0000",
                  "50 %",
                  Colors.amber,
                  0.5,
                  false),
              Posts(
                  "https://picsum.photos/250?image=7",
                  "Rafa",
                  "5/0/2020",
                  "BUY/SELL",
                  "Selling Mazda 6 2007 with a few scratches",
                  "https://picsum.photos/250?image=203",
                  "OPINION",
                  "50 %",
                  Colors.red,
                  0.5,
                  true),
              Posts(
                  "https://picsum.photos/250?image=5",
                  "Rafael",
                  "0/5/2020",
                  "NEWS / ALERTS",
                  "COVID-19 shots for free!!",
                  "https://picsum.photos/250?image=10",
                  "Tomorrow 10 of October the Health Department in Sunnyvale are going to give for free tests for covid-19...",
                  "50 %",
                  Colors.grey,
                  0.5,
                  false),
              SizedBox(
                height: 18.0,
              ),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.create,
          color: Colors.grey.shade700,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}