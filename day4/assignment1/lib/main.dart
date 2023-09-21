// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 0;
  int y = 0;
  int result = 0;

  showResultDialog(BuildContext context, int result) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
                child: Text(
              "$result",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("사칙연산"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("X의 값은?"),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 180,
                child: TextField(
                  onChanged: (value) {
                    x = int.parse(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'x값을 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Y의 값은?"),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 180,
                child: TextField(
                  onChanged: (value) {
                    y = int.parse(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'y값을 입력하세요.',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  result = x + y;
                  setState(() {});
                  showResultDialog(context, result);
                },
                child: Text("더하기의 결과값은?")),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  result = x * y;
                  setState(() {});
                  showResultDialog(context, result);
                },
                child: Text("곱하기의 결과값은?")),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  result = x - y;
                  setState(() {});
                  showResultDialog(context, result);
                },
                child: Text("빼기의 결과값은?")),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: () {
                  result = (x / y).round();
                  setState(() {});
                  showResultDialog(context, result);
                },
                child: Text("나누기의 결과값은?")),
          ),
        ],
      ),
    );
  }
}
