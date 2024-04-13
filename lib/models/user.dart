import 'package:photographyapp/models/collocation.dart';

class User {
  final String name;
  final String profilePicture;
  final String username;
  final int followers;
  final List<Collocation> collocation;
  final int following;

  User(
      {required this.name,
      required this.profilePicture,
      required this.username,
      required this.followers,
      required this.collocation,
      required this.following});
}
