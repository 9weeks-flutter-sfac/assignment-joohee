// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/view/dataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.username}님 안녕하세요',
                  style: TextStyle(fontSize: 32),
                ),
                Obx(
                  () => controller.documents.value != null
                      ? DataView(controller.documents.value!)
                      : SizedBox(),
                ), //Data가 도착하면 보여준다
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(user.username),
                  subtitle: Text(user.name),
                ),
                Text(
                  '${user.username}님 안녕하세요',
                  style: TextStyle(fontSize: 32),
                ),
                ListTile(
                  title: Text('로그아웃하기'),
                  leading: Icon(Icons.logout),
                  onTap: controller.logout,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: controller.readDocuments, child: Icon(Icons.refresh)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.moveToPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ],
        ),
      ),
    );
  }
}
