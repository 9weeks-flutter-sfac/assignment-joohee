import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  var uploadController = TextEditingController();

  upload() async {
    if (uploadController.text.isEmpty) return;
    Dio dio = Dio();
    try {
      var res = await dio.post(ApiRoutes.upload, data: {
        'secret': uploadController.text,
        'author': Get.find<AuthController>().user!.id,
        'authorName': Get.find<AuthController>().user!.username,
      });
      if (res.statusCode == 200) {
        uploadController.text = '';
        Get.back();
        Get.snackbar('달에게 비밀이 전달됐어요:)', '');
      }
    } on DioException catch (e) {
      print('Error in signup(): ${e.message}');
      Get.snackbar('비밀 공유에 실패했어요:(', '다시 시도해 주세요');
    }
  }
}
