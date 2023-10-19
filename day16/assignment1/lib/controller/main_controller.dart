// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:assignment1/model/document.dart';
import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController pageController = PageController();
  RxInt curPage = 0.obs;

  final Rxn<List<Document>> documents = Rxn();

  moveToPage(index) {
    pageController.jumpToPage(index);
    curPage(index);
  }

  logout() {
    Get.find<AuthController>().logout();
  }

  readDocuments() async {
    print('readDoucuments 실행');
    var token = Get.find<AuthController>().token;
    if (token != null) {
      //token이 null이 아닐 때
      Dio dio = Dio();
      dio.options.baseUrl = 'http://52.79.115.43:8090';
      dio.options.headers["Authorization"] = "Bearer ${token}";
      try {
        var res = await dio.get(
          ApiRoutes.documentApi,
          // options: Options(headers: {"authorization": "Bearer ${token}"})
        );
        if (res.statusCode == 200) {
          var data = List<Map<String, dynamic>>.from(res.data['items']);
          documents(data.map((e) => Document.fromMap(e)).toList());
        }
      } on DioException catch (e) {
        print('in DioException ${e.message}');
      }
    }
  }
}
