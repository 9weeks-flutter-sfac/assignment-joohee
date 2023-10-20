import 'package:animate_do/animate_do.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.PNG'))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  BounceInDown(
                    duration: Duration(milliseconds: 1500),
                    child: Image.asset(
                      'assets/images/moon.PNG',
                      width: 300,
                    ),
                  ),
                  FadeIn(
                    delay: Duration(milliseconds: 1500),
                    duration: Duration(milliseconds: 1500),
                    child: Image.asset(
                      'assets/images/kiwi.PNG',
                      width: 230,
                    ),
                  ),
                ],
              ),
              TextButton(
                child: Text('시작하기',
                    style: TextStyle(
                        color: Color.fromARGB(209, 246, 246, 224),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  Get.toNamed(LoginPage.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
