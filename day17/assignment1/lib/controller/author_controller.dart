import 'package:assignment1/model/user.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthorController extends GetxController {
  final RxList<User> _users = <User>[].obs;

  List<User> get users => _users;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  getUsers() async {
    Dio dio = Dio();
    try {
      var res = await dio.get(ApiRoutes.read);
      if (res.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(res.data['items']);
        _users(data.map((e) => User.fromMap(e)).toList());
      }
    } on DioException catch (e) {
      print('Error in login(): ${e.message}');
    }
  }
}
