import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.menu, required this.imgUrl});

  final String menu;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            menu,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            '[담기]',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
