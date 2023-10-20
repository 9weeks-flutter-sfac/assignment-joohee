// ignore_for_file: prefer_const_constructors

import 'package:assignment1/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});
  static const String route = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202f4c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '회원가입',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: controller.emailController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  label: Text('Email'),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: controller.pwController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  label: Text('Password'),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: controller.pw2Controller,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  label: Text('Check Password'),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: controller.idController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  label: Text('Username'),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: controller.signup,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                child: Text(
                  '회원가입 하기',
                  style: TextStyle(
                      color: Color(0xFF202f4c),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
