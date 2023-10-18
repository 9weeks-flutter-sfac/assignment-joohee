// ignore_for_file: prefer_const_constructors

import 'package:assignment1/controller/app_controller.dart';
import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'shop_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppController>();
    var settingController = Get.find<AppSettingController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(settingController.appName),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
          child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
                'Current coin: ${controller.coin.value}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              )),
          SizedBox(
            height: 8,
          ),
          Icon(
            FontAwesomeIcons.bitcoin,
            size: 96,
            color: Colors.yellow.shade700,
          ),
          SizedBox(
            height: 8,
          ),
          TextButton(
              onPressed: () {
                Get.to(() => ShopPage());
              },
              child: Text('상점으로 이동하기')),
        ],
      )),
    );
  }
}
