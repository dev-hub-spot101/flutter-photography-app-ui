import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photographyapp/data/sample.dart';
import 'package:photographyapp/helper/colors.dart';
import 'package:photographyapp/models/post.dart';
import 'package:photographyapp/screens/detail_screen.dart';
import 'package:photographyapp/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorsys.lightGrey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colorsys.lightGrey,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colorsys.darkGrey),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Best place to \nFind awesome photos",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colorsys.darkGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(
                          left: 20, right: 3, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search for photo",
                                  hintStyle: TextStyle(color: Colorsys.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            height: double.infinity,
                            minWidth: 50,
                            elevation: 0,
                            color: Colorsys.orange,
                            child: Icon(Icons.search, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "For you",
                      style: TextStyle(
                          color: Colorsys.darkGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colorsys.lightGrey))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Recommend",
                                style: TextStyle(
                                    color: Colorsys.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Container(
                                width: 50,
                                padding: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colorsys.orange, width: 3))),
                              )
                            ],
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Likes",
                            style: TextStyle(
                                color: Colorsys.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    makePost(Sample.postOne),
                    makePost(Sample.postTwo),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget makePost(Post postOne) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: postOne.user)));
            },
            child: Row(
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: postOne.user!.username,
                  child: CircleAvatar(
                    maxRadius: 28,
                    backgroundImage: AssetImage(postOne.user!.profilePicture),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postOne.user!.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            postOne.location,
                            style:
                                TextStyle(fontSize: 13, color: Colorsys.grey),
                          ),
                          Text(
                            postOne.dateAgo,
                            style:
                                TextStyle(fontSize: 13, color: Colorsys.grey),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: postOne.photos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                post: postOne, image: postOne.photos[index])));
                  },
                  child: AspectRatio(
                    aspectRatio: 1.2 / 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(postOne.photos[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colorsys.orange),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey.shade600
                                                .withOpacity(0.1)),
                                        child: Center(
                                          child: Image.asset(
                                              'assets/icons/link.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey.shade600
                                                .withOpacity(0.1)),
                                        child: Center(
                                          child: Image.asset(
                                              'assets/icons/heart.png'),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
