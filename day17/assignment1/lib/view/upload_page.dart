// ignore_for_file: prefer_const_constructors

import 'package:assignment1/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});
  static const String route = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.PNG'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.uploadController,
                style: TextStyle(color: Color.fromARGB(209, 246, 246, 224)),
                cursorColor: Color.fromARGB(209, 246, 246, 224),
                maxLines: 8,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(209, 246, 246, 224),
                            width: 2.0)),
                    labelText: '달에게 비밀을 말해보아요!',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // 외곽선 제거
                    ),
                    fillColor: Colors.white10,
                    filled: true,
                    labelStyle:
                        TextStyle(color: Color.fromARGB(209, 246, 246, 224))),
              ),
            ),
            InkWell(
              onTap: controller.upload,
              child: Image.asset(
                'assets/images/moon.PNG',
                width: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
