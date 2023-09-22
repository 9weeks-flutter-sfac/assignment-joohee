// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment2/MenuCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> order = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.red,
          title: Text(
            '마라왕 신주희 주문하기',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
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
              Text(order.toString()),
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
        floatingActionButton: FloatingActionButton.extended(
          label: Text('초기화하기'),
          onPressed: () {
            order = [];
            setState(() {});
          },
        ),
      ),
    );
  }

//   Widget makeGridView() {
//     List<String> menuList = [
//       '마라탕',
//       '마라샹궈',
//       '꿔바로우',
//       '깐쇼새우',
//       '공기밥',
//       '단무지',
//       '빙홍차',
//       '제로콜라',
//     ];

//     List<String> urlList = [
//       'assets/maratang.jpg',
//       'assets/marashanguo.jpg',
//       'assets/gguobarou.jpg',
//       'assets/gganshosaewoo.png',
//       'assets/airbob.jpg',
//       'assets/danmugi.jpg',
//       'assets/binghongcha.jpg',
//       'assets/zerocolaupsoyong.jpg'
//     ];

//     return GridView.count(
//       crossAxisCount: 3,
//       shrinkWrap: true, // 이걸 하니까 뭔가 나오긴 함
//       children: List.generate(menuList.length, (index) {
//         return InkWell(
//           onTap: () {
//             order.add(menuList[index]);
//             setState(() {});
//           },
//           child: Container(
//             margin: EdgeInsets.all(4),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     urlList[index],
//                     // height: 80,
//                     // width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Text(menuList[index]),
//                 Text('[담기]'),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
}
