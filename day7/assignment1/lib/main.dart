// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Assignment(),
    );
  }
}

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  final imageUrl = [
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/33053/dog-young-dog-small-dog-maltese.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/10361796/pexels-photo-10361796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/9409823/pexels-photo-9409823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];

  var index = Random().nextInt(5);
  int currentPage = 1;
  PageController pageController = PageController();
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7일차 과제 $currentPage번'),
      ),
      body: SmartRefresher(
        header: WaterDropHeader(),
        enablePullDown: true,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 1000));
          setState(() {
            index = Random().nextInt(5);
          });
          _refreshController.refreshCompleted();
        },
        controller: _refreshController,
        child: PageView(
            controller: pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page + 1;
              });
            },
            children: [
              Center(
                child: ClipRRect(
                  child: Image.network(imageUrl[index]),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(milliseconds: 2500)),
                  items: imageUrl.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          child: Image.network(
                            i,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ]),
      ),
    );
  }
}
