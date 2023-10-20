// ignore_for_file: prefer_const_constructors
import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/author_controller.dart';
import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/controller/signup_controller.dart';
import 'package:assignment1/controller/upload_controller.dart';
import 'package:assignment1/util/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SignUpController(), fenix: true);
        Get.lazyPut(() => AuthorController(), fenix: true);
        Get.lazyPut(() => SecretController(), fenix: true);
        Get.lazyPut(() => UploadController(), fenix: true);
      }),
      getPages: AppPages.pages,
      initialRoute: '/',
    );
  }
}
