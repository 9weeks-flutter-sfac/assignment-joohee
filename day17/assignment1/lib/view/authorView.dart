import 'package:assignment1/model/user.dart';
import 'package:flutter/material.dart';

class AuthorView extends StatelessWidget {
  const AuthorView({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: ClipOval(child: Image.asset('assets/images/kiwiIcon.PNG')),
          title: Text(users[index].username),
          subtitle: Text(users[index].created),
        );
      },
    );
  }
}
