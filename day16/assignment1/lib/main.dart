import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:assignment1/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage())
      ],
      home: Scaffold(
        body: Center(
            child: TextButton(
          child: Text('로그인 하기'),
          onPressed: () {
            Get.toNamed(LoginPage.route);
          },
        )),
      ),
    );
  }
}
