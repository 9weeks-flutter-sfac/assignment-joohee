// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment/MusicTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.dark(),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: Border(
            bottom: BorderSide(color: Colors.white24, width: 1),
          ),
          leading: Icon(Icons.navigate_before),
          title: Text(
            "아워리스트",
            style: TextStyle(fontSize: 16),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.airplay,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                size: 20,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            // Divider(
            //   height: 1,
            //   color: Colors.white10,
            // ),
            MusicTile(
                imgUrl: 'assets/images/music_come_with_me.png',
                title: 'Come with me',
                subtitle: 'Surfaces 및 salem ilese',
                length: '3:00'),
            MusicTile(
                imgUrl: 'assets/images/music_good_day.png',
                title: 'Good day',
                subtitle: 'Surfaces',
                length: '3:09'),
            MusicTile(
                imgUrl: 'assets/images/music_honesty.png',
                title: 'Honesty',
                subtitle: 'Pink Sweat\\\$',
                length: '3:00'),
            MusicTile(
                imgUrl: 'assets/images/music_i_wish_i_missed_my_ex.png',
                title: 'I Wish I Missed My Ex',
                subtitle: '마할리아 버크마',
                length: '3:24'),
            MusicTile(
                imgUrl: 'assets/images/music_plastic_plants.png',
                title: 'Plastic Plants',
                subtitle: '마할리아 버크마',
                length: '3:10'),
            MusicTile(
                imgUrl: 'assets/images/music_sucker_for_you.png',
                title: 'Sucker for you',
                subtitle: '맷 테리',
                length: '3:00'),
            MusicTile(
                imgUrl: 'assets/images/music_summer_is_for_falling_in_love.png',
                title: 'Summer is for falling in love',
                subtitle: 'Sarah Kang & Eye Love Brandon이것도 어디까지 늘어나는데',
                length: '3:20'),
            MusicTile(
                imgUrl: 'assets/images/music_these_days.png',
                title: 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
                subtitle: 'Rudimental',
                length: '3:00'),
            MusicTile(
                imgUrl: 'assets/images/music_you_make_me.png',
                title: 'You Make Me',
                subtitle: 'DAY6',
                length: '3:08'),
            MusicTile(
                imgUrl: 'assets/images/music_zombie_pop.png',
                title: 'Zombie Pop',
                subtitle: 'DRP IAN',
                length: '3:00'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white12,
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          selectedItemColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 16,
                ),
                label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 16,
                ),
                label: '둘러보기'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music, size: 16), label: '보관함'),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white12,
              padding: EdgeInsets.only(left: 8),
              height: 60,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 45,
                      height: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child:
                            Image.asset('assets/images/music_you_make_me.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Text(
                          'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow
                              .ellipsis, //text overflow 시 ... 으로 마무리
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Text(
                          'DAY6DAY6DAY6DAY6DAY6DAY6DAY6DAY6DAY6DAY6',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white60,
                          ),
                          overflow: TextOverflow
                              .ellipsis, //text overflow 시 ... 으로 마무리
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.play_arrow,
                      size: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 5),
                    child: Icon(
                      Icons.skip_next,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 1,
              child: Container(
                width: 80,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
