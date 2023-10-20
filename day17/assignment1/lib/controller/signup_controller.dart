// import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var emailController = TextEditingController();
  var idController = TextEditingController();
  var pwController = TextEditingController();
  var pw2Controller = TextEditingController();

  signup() {
    Get.find<AuthController>().signUp(emailController.text, pwController.text,
        pw2Controller.text, idController.text);
  }
}
