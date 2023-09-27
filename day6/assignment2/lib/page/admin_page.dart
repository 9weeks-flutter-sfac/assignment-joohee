import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('메뉴 추가'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('메뉴 삭제'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('메뉴 수정'),
          ),
        ],
      ),
    );
  }
}
