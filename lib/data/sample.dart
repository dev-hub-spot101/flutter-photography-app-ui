import 'package:photographyapp/models/collocation.dart';
import 'package:photographyapp/models/post.dart';
import 'package:photographyapp/models/user.dart';

class Sample {
  static User user1 = new User(
      name: "User devhubspot",
      username: "@udevhubspot",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/user-1.jpg",
      collocation: [
        new Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/one.jpg",
            posts: [
              new Post(
                  location: "indore, India",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/one.jpg',
                    'assets/photos/two.jpg',
                    'assets/photos/three.jpg',
                  ]),
              new Post(
                  location: "Mahow, Indore",
                  dateAgo: "2 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ])
            ]),
        new Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/five.jpg",
            posts: [
              new Post(location: "Goa, India", dateAgo: "3 min ago", photos: [
                'assets/photos/one.jpg',
                'assets/photos/two.jpg',
                'assets/photos/three.jpg',
              ]),
              new Post(
                  location: "Delhi, India",
                  dateAgo: "2 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ])
            ]),
      ]);

  static User user2 = new User(
      name: "user2 devhubspot",
      username: "@u2devhubspot",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/user-2.jpg",
      collocation: [
        new Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/two.jpg",
            posts: [
              new Post(location: "Delhi, India", dateAgo: "3 min ago", photos: [
                'assets/photos/five.jpg',
                'assets/photos/six.jpg',
                'assets/photos/seven.jpg',
              ]),
              new Post(location: "Goa, India", dateAgo: "2 week ago", photos: [
                'assets/photos/six.jpg',
                'assets/photos/eight.jpg',
                'assets/photos/two.jpg',
              ])
            ]),
      ]);

  static Post postOne = new Post(
      user: user1,
      location: "Indore, India",
      dateAgo: "3 min ago",
      photos: [
        'assets/photos/one.jpg',
        'assets/photos/two.jpg',
        'assets/photos/three.jpg'
      ],
      relatedPhotos: [
        'assets/photos/four.jpg',
        'assets/photos/five.jpg',
        'assets/photos/six.jpg',
        'assets/photos/seven.jpg',
        'assets/photos/eight.jpg'
      ]);

  static Post postTwo = new Post(
      user: user2,
      location: "Delhi, India",
      dateAgo: "3 min ago",
      photos: [
        'assets/photos/four.jpg',
        'assets/photos/five.jpg',
        'assets/photos/six.jpg',
      ],
      relatedPhotos: [
        'assets/photos/one.jpg',
        'assets/photos/two.jpg',
        'assets/photos/three.jpg',
        'assets/photos/four.jpg',
        'assets/photos/five.jpg'
      ]);
}
