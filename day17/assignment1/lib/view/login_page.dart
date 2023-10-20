// ignore_for_file: prefer_const_constructors

import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF202f4c),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipOval(
              child: Image.asset(
            'assets/images/kiwiIcon.PNG',
            width: 100,
          )),
          Text(
            '달밤에 키위',
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: '아이디 입력',
            ),
            controller: controller.idController,
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: '비밀번호 입력',
            ),
            controller: controller.pwController,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: controller.login,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: Text(
              '로그인',
              style: TextStyle(
                  color: Color(0xFF202f4c),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(SignUpPage.route);
            },
            child: Text(
              '회원가입 하기',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
