import 'package:assignment1/model/user.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:assignment1/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final RxnString _token = RxnString();

  User? get user => _user.value;
  String? get token => _token.value;

  Dio dio = Dio();
  login(String id, String pw) async {
    try {
      var res = await dio.post(ApiRoutes.login, data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _token(res.data['token']);
        _user(user);
      }
    } on DioException catch (e) {
      print('Error in login(): ${e.message}');
    }
  }

  logout() {
    _user.value = null;
  }

  signUp(String email, String pw, String pw2, String username) async {
    Dio dio = Dio();

    try {
      var res = await dio.post(ApiRoutes.signup, data: {
        'email': email,
        'password': pw,
        'passwordConfirm': pw2,
        'username': username,
      });

      if (res.statusCode == 200) {
        Get.snackbar('회원가입을 성공했습니다', '로그인 해주세요');
        Get.offAndToNamed(LoginPage.route);
      } else {
        Get.snackbar('회원가입에 실패했습니다', '다시 시도해주세요');
      }
    } on DioException catch (e) {
      print('Error in signup(): ${e.message}');
      Get.snackbar('회원가입에 실패했습니다', '다시 시도해주세요');
    }
  }

  _handleUserChanged(User? user) {
    if (user != null) {
      Get.toNamed(MainPage.route);
      return;
    }
    Get.toNamed(LoginPage.route);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleUserChanged);
  }
}
