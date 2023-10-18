import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppSettingController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('앱 정보'),
        backgroundColor: Colors.yellow.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('app version: ${controller.appVersion}'),
            Text('app name: ${controller.appName}'),
            Text('app author: ${controller.appAuthor}'),
            Text(
                'last updated: ${DateFormat.yMMMd().format(controller.lastUpdated!)}'),
          ],
        ),
      ),
    );
  }
}
