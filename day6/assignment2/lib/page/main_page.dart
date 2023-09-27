// ignore_for_file: prefer_const_constructors

import 'package:assignment2/page/admin_page.dart';
import 'package:assignment2/widget/MenuCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> order = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        title: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminPage(),
                ));
          },
          child: Text(
            '마라왕 신주희 주문하기',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주문 리스트',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // Text(order.toString()),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: order.map((e) {
                  return Chip(
                    label: Text(e),
                    onDeleted: () {
                      order.remove(e);
                      setState(() {});
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '메뉴',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // makeGridView(),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      order.add('마라탕');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '마라탕',
                      imgUrl: 'assets/maratang.jpg',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      order.add('마라샹궈');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '마라샹궈',
                      imgUrl: 'assets/marashanguo.jpg',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      order.add('꿔바로우');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '꿔바로우',
                      imgUrl: 'assets/gguobarou.jpg',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      order.add('깐쇼새우');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '깐쇼새우',
                      imgUrl: 'assets/gganshosaewoo.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      order.add('공기밥');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '공기밥',
                      imgUrl: 'assets/airbob.jpg',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      order.add('단무지');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '단무지',
                      imgUrl: 'assets/danmugi.jpg',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      order.add('빙홍차');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '빙홍차',
                      imgUrl: 'assets/binghongcha.jpg',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      order.add('제로콜라');
                      setState(() {});
                    },
                    child: MenuCard(
                      menu: '제로콜라',
                      imgUrl: 'assets/zerocolaupsoyong.jpg',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: (order.isNotEmpty) ? true : false,
        child: FloatingActionButton.extended(
          label: Text('결제하기'),
          onPressed: () {},
        ),
      ),
    );
  }
}
