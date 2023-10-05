// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:assignment1/DogCard.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<String> imgList;
  late List<String> msgLisg;
  final Connectivity connectivity = Connectivity();
  var connectedChecking = false;

  void checkConnectivityWifi() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      print('인터넷에 연결되어있습니다.');
    }
  }

  Future getData() async {
    var dio = Dio();
    var res = await dio.get('https://sniperfactory.com/sfac/http_day16_dogs');
    return Future.delayed(Duration(milliseconds: 3000)).then((value) => res);
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('8일차 과제'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (connectedChecking) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SpinKitFadingFour(
                    color: Colors.blue,
                  ),
                  Text(
                    '인터넷 연결 확인중입니다',
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                enabled: true,
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 3 / 4),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card();
                    }),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return SmartRefresher(
                controller: refreshController,
                enablePullDown: true,
                onRefresh: () async {
                  await Future.delayed(Duration(milliseconds: 2000));
                  setState(() {});
                  refreshController.refreshCompleted();
                },
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3 / 4),
                  itemCount: snapshot.data!.data["body"].length,
                  itemBuilder: (context, index) {
                    return DogCard(
                        imgUrl: snapshot.data!.data["body"][index]["url"],
                        msg: snapshot.data!.data["body"][index]["msg"]);
                  },
                ),
              );
            }
            return Text("error");
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            connectedChecking = true;
            setState(() {});

            checkConnectivityWifi();
            Future.delayed(Duration(milliseconds: 2000), () {
              connectedChecking = false;
              setState(() {});
            });
          },
          child: Icon(Icons.wifi_find),
        ),
      ),
    );
  }
}
