// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.menu, required this.imgUrl});

  final String menu;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(menu),
          Text('[담기]'),
        ],
      ),
    );
  }
}
