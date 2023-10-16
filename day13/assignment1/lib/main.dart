// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:assignment1/model/dog.dart';
import 'package:flutter/material.dart';
import 'page/post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: PostPage(),
    );
  }
}
