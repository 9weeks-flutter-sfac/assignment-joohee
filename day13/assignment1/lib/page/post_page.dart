// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment1/model/post.dart';
import 'package:assignment1/widget/PostTile.dart';
import 'package:assignment1/widget/post_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  Future<List<Post>> getPost() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    Dio dio = Dio();
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      return data.map((e) => Post.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Post> posts = snapshot.data!;
          return ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Text(
                              'Post 1 ~ 5',
                              style: TextStyle(fontSize: 24),
                            ),
                          )
                        : SizedBox(),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        context: context,
                        builder: (context) {
                          return PostBottomSheet(post: posts[index]);
                        },
                      ),
                      child: PostTile(
                        post: posts[index],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                if ((index + 1) % 5 == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Text(
                      'Post ${index + 2} ~ ${index + 6}',
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                }
                return SizedBox();
              },
              itemCount: posts.length);
        }
        return SizedBox();
      },
    ));
  }
}
