// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:assignment1/controller/author_controller.dart';
import 'package:assignment1/view/authorView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorPage extends GetView<AuthorController> {
  const AuthorPage({super.key});

  static const String route = '/author';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202f4c),
      appBar: AppBar(
        foregroundColor: Color.fromARGB(209, 246, 246, 224),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        // height: 100,
        child: Obx(
          () => controller.users.length > 1
              ? AuthorView(users: controller.users)
              : Text('불러오는 중입니다'),
        ),
      ),
    );
  }
}
