import 'package:assignment1/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppController>();
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Get.snackbar('하이루', '방가', snackPosition: SnackPosition.BOTTOM);
          },
          child: Icon(Icons.add),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('메모 개수: ${controller.memos.length}'),
            ElevatedButton(onPressed: () => Get.back(), child: Text('뒤로 가기')),
          ],
        )));
  }
}
