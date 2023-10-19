// ignore_for_file: avoid_print

import 'package:assignment1/model/user.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:assignment1/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final RxnString _token = RxnString(null);

  User? get user => _user.value;
  String? get token => _token.value;

  _hadleAuthorChanged(User? data) {
    if (data != null) {
      //메인페이지로
      Get.toNamed(MainPage.route);
      return;
    }
    Get.toNamed(LoginPage.route);
    return;
  }

  login(String id, String pw) async {
    Dio dio = Dio();

    dio.options.baseUrl = 'http://52.79.115.43:8090';
    try {
      var res = await dio.post(ApiRoutes.authWithPassword, data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _token(res.data['token']);
        _user(user); //token이랑 자리 바궈보자
      }
    } on DioException catch (e) {
      print('in DioException ${e.message}');
      print(e.requestOptions.onSendProgress);
      print(e.requestOptions.onReceiveProgress);
    }
  }

  logout() {
    _user.value = null;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _hadleAuthorChanged);
  }
}
