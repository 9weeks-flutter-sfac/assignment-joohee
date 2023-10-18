// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:assignment1/controller/app_controller.dart';
import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:assignment1/view/main_page.dart';
// import 'package:assignment1/view/info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController()); //생성
    var settingController = Get.put(AppSettingController());
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse}),
      home: MainPage(),
    );
  }
}
