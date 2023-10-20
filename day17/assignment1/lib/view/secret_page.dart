import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/view/secretView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretPage extends GetView<SecretController> {
  const SecretPage({super.key});

  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Color.fromARGB(209, 246, 246, 224),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Obx(
          () => controller.secrets.length > 1
              ? SecretView(secrets: controller.secrets)
              : Text('불러오는 중입니다'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(209, 246, 246, 224),
        onPressed: controller.getSecrets,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
