// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Column(
            children: [
              Text(
                '오늘의 하루는',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(
                '어땠나요?',
                style: TextStyle(fontSize: 16),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                height: 160,
                width: 240,
                child: PageView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.pink,
                            Colors.lime,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '행복함',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.yellow,
                            Colors.cyan,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '즐거움',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.brown,
                            Colors.blueGrey,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '피곤함',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.red,
                            Colors.black38,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '불안함',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.teal,
                            Colors.deepPurple,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '두려움',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                color: Colors.blue,
                height: 80,
                width: 500,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/man.png',
                          scale: 1.4,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 14.0, bottom: 2.0),
                          child: Text(
                            '라이언',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '게임개발\nC#, Unity',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
