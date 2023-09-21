// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MusicTile extends StatelessWidget {
  const MusicTile(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subtitle,
      required this.length});

  final String imgUrl;
  final String title;
  final String subtitle;
  final String length;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 45,
              height: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(imgUrl),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, //text overflow 시 ... 으로 마무리
                ),
              ),
              Container(
                width: 200,
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 12,
                    ),
                    Flexible(
                      child: Text(
                        ' $subtitle',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white60,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      ' · $length',
                      style: TextStyle(fontSize: 10, color: Colors.white60),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.more_vert,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
