import 'package:assignment1/model/post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text('${post.id}')),
      title: Text(post.title),
      subtitle: Text(post.body),
    );
  }
}
