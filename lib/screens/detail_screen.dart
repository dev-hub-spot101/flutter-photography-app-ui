import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photographyapp/helper/colors.dart';
import 'package:photographyapp/models/post.dart';

class DetailScreen extends StatelessWidget {
  final Post? post;
  final String? image;

  const DetailScreen({super.key, this.post, this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 70, bottom: 20, left: 20, right: 20),
              height: height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(image!), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black.withOpacity(0.2)),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage:
                                AssetImage(post!.user!.profilePicture),
                          ),
                          SizedBox(width: 10),
                          Text(
                            post!.user!.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            width: 32.0,
                            height: 32.0,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey.shade600.withOpacity(0.1)),
                            child: Center(
                              child: Image.asset('assets/icons/download.png'),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset('assets/icons/location.png', scale: 2.2),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Indore, India",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colorsys.grey),
                      )
                    ],
                  ),
                  makeRelatedPhotos(post!)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeRelatedPhotos(Post post) {
    return MasonryGridView.count(
        itemCount: post.relatedPhotos!.length,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Image(
              image: AssetImage(post.relatedPhotos![index]),
              fit: BoxFit.cover,
            ));
  }
}
