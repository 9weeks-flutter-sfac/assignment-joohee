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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Assignment2(),
                    ));
              },
              child: Text('2번 과제'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Assignment3(),
                    ));
              },
              child: Text('3번 과제'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Assignment4(),
                    ));
              },
              child: Text('4번 과제'),
            )
          ],
        ),
      ),
    );
  }
}

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});
  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  //const 없애서 리스트 선언 가능해짐
  List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
            controller: scrollController,
            itemCount: animalList.length,
            itemBuilder: (BuildContext ctx, int idx) {
              return Container(
                height: 300,
                child: Center(child: Text(animalList[idx])),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            scrollController.jumpTo(0);
          });
        },
        child: Icon(
          Icons.vertical_align_top,
        ),
      ),
    );
  }
}

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  String mirroring = "";
  var textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2번 문제'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: textFieldController,
            onChanged: (value) {
              mirroring = value;
              setState(() {});
            },
          ),
          Text(mirroring),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textFieldController.clear();
          mirroring = "";
          setState(() {});
        },
        child: Icon(Icons.close),
      ),
    );
  }
}

class Assignment4 extends StatefulWidget {
  const Assignment4({super.key});

  @override
  State<Assignment4> createState() => _Assignment4State();
}

class _Assignment4State extends State<Assignment4> {
  bool isSun = false;
  bool isMoon = false;
  bool isStar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            leading: isSun
                ? Icon(
                    Icons.sunny,
                    color: Colors.red,
                  )
                : Icon(Icons.sunny),
            title: Text('Sun'),
            trailing: IconButton(
              onPressed: () {
                isSun = !isSun;
                setState(() {});
              },
              icon: Icon(Icons.arrow_right),
            ),
          ),
          ListTile(
            leading: isMoon
                ? Icon(
                    Icons.nightlight,
                    color: Colors.yellow,
                  )
                : Icon(Icons.nightlight),
            title: Text('Moon'),
            trailing: IconButton(
              onPressed: () {
                isMoon = !isMoon;
                setState(() {});
              },
              icon: Icon(Icons.arrow_right),
            ),
          ),
          ListTile(
            leading: isStar
                ? Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : Icon(Icons.star),
            title: Text('Star'),
            trailing: IconButton(
              onPressed: () {
                isStar = !isStar;
                setState(() {});
              },
              icon: Icon(Icons.arrow_right),
            ),
          ),
          TextField(
            onSubmitted: (value) {
              if (value == '태양') {
                isSun = !isSun;
              } else if (value == '달') {
                isMoon = !isMoon;
              } else if (value == '별') {
                isStar = !isStar;
              }
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: '키고 끄고싶은 아이콘을 입력하세요.',
              hintStyle: TextStyle(fontSize: 14),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isSun = false;
          isMoon = false;
          isStar = false;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
