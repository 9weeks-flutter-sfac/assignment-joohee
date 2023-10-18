// ignore_for_file: prefer_const_constructors

import 'package:assignment1/controller/app_controller.dart';
import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:assignment1/view/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppController>();
    var appSettingController = Get.find<AppSettingController>();
    void resetCoin() {
      controller.coin(0);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('상점'),
        backgroundColor: Colors.yellow.shade700,
        elevation: 0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '${appSettingController.appAuthor}\'s 상점',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Obx(() => Text('현재 보유한 코인: ${controller.coin.value}')),
          SizedBox(
            height: 4,
          ),
          TextButton(
              onPressed: () {
                controller.coin(0); // == controller.coin.value = 0
              },
              child: Text('코인리셋'))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow.shade700,
        onPressed: () {
          Get.to(() => SettingPage());
        },
        child: Icon(Icons.info),
      ),
    );
  }
}
