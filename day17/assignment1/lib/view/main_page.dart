// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/view/author_page.dart';
import 'package:assignment1/view/secret_page.dart';
import 'package:assignment1/view/setting_page.dart';
import 'package:assignment1/view/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var secret = Get.find<SecretController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.PNG'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //image
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    BounceInDown(
                      duration: Duration(milliseconds: 1500),
                      child: Image.asset(
                        'assets/images/moon.PNG',
                        width: 220,
                      ),
                    ),
                    FadeIn(
                      delay: Duration(milliseconds: 1500),
                      duration: Duration(milliseconds: 1500),
                      child: Image.asset(
                        'assets/images/kiwi.PNG',
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1500),
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    '달아,',
                    style: TextStyle(
                        color: Color.fromARGB(255, 245, 245, 203),
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1500),
                duration: Duration(milliseconds: 1000),
                child: Text(
                  '너는 내 말을 들어주겠니?',
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: InkWell(
                  onTap: () {
                    secret.getSecrets(); //비밀 보기
                    Get.toNamed(SecretPage.route);
                  },
                  child: FadeInDown(
                    from: 20,
                    delay: Duration(milliseconds: 2500),
                    child: ListTile(
                      leading: ClipOval(
                          child: Image.asset(
                        'assets/images/kiwiIcon.PNG',
                      )),
                      title: Text(
                        '오늘 밤에는 달이 휘영청 떴네요',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '비밀 보러가기',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color.fromARGB(209, 246, 246, 224)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: () {
                    // 작성자들 보러가기
                    // secret.getUsers();
                    Get.toNamed(AuthorPage.route);
                  },
                  child: FadeInDown(
                    from: 20,
                    delay: Duration(milliseconds: 3000),
                    child: ListTile(
                      leading: ClipOval(
                          child: Image.asset('assets/images/kiwiIcon.PNG')),
                      title: Text(
                        '달빛에 비춘 사람들이 있어요',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '작성자 보러가기',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color.fromARGB(209, 246, 246, 224)),
                      ),
                    ),
                  ),
                ),
              ),
              FadeInDown(
                from: 20,
                delay: Duration(milliseconds: 3500),
                child: ListTile(
                  onTap: () {
                    //비밀 올리기
                    Get.toNamed(UploadPage.route);
                  },
                  leading: ClipOval(
                      child: Image.asset('assets/images/kiwiIcon.PNG')),
                  title: Text(
                    '달에게 비밀을 말해보아요',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '비밀공유 하러가기',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Color.fromARGB(209, 246, 246, 224)),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(SettingPage.route);
                },
                child: Text('설정 페이지', style: TextStyle(color: Colors.white60)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
