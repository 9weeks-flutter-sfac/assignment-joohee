// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:assignment1/model/secret.dart';
import 'package:flutter/material.dart';

class SecretView extends StatelessWidget {
  const SecretView({super.key, required this.secrets});

  final List<Secret> secrets;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.PNG'))),
        child: PageView.builder(
          itemCount: secrets.length,
          itemBuilder: (context, index) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElasticIn(
                    child: SizedBox(
                      width: 80,
                      child: ClipOval(
                          child: Image.asset('assets/images/kiwiIcon.PNG')),
                    ),
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 500),
                    from: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "내 비밀은 \n${secrets[index].secret}\n이야",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(209, 246, 246, 224),
                            fontSize: 20),
                      ),
                    ),
                  ),
                  ShakeX(
                      child: Text(
                    secrets[index].authorName == ""
                        ? '익명'
                        : secrets[index].authorName,
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  )),
                ]);
          },
        ));
  }
}
