// ignore_for_file: prefer_const_constructors

import 'package:assignment1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<AuthController> {
  const SettingPage({super.key});
  static const String route = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202f4c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          children: [
            ListTile(
              leading:
                  ClipOval(child: Image.asset('assets/images/kiwiIcon.PNG')),
              title: Text(controller.user!.username,
                  style: TextStyle(
                      color: Color.fromARGB(209, 246, 246, 224),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(controller.user?.email ?? '',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'created: ${controller.user!.created}',
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    'updated: ${controller.user!.updated}',
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: controller.logout,
                    child: Text(
                      "로그아웃 하기",
                      style:
                          TextStyle(color: Color.fromARGB(209, 246, 246, 224)),
                    )),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: controller.logout,
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
