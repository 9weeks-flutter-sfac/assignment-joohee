import 'package:assignment1/model/secret.dart';
import 'package:assignment1/util/api_routes.dart';
import 'package:assignment1/view/secret_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SecretController extends GetxController {
  final RxList<Secret> _secrets = <Secret>[].obs;
  RxBool isSecretEmpty = true.obs;

  List<Secret> get secrets => _secrets;

  @override
  void onInit() {
    super.onInit();
    getSecrets();
  }

  getSecrets() async {
    Dio dio = Dio();
    try {
      var res = await dio.get(ApiRoutes.secrets);
      if (res.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(res.data['items']);
        _secrets!(data.map((e) => Secret.fromMap(e)).toList());
      }
    } on DioException catch (e) {
      print('Error in getSecrets(): ${e.message}');
    }
  }
}
