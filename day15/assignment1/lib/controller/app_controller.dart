import 'dart:async';
import 'package:get/get.dart';

class AppController extends GetxController {
  //RxList<String> memos = RxList<String>(); //공유자원 만듦
  // Rxn<User> currentUSer = Rxn();
  RxInt coin = RxInt(0);
  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      coin++;
    });

    ever(coin, (_) {
      if (coin % 10 == 0) {
        Get.snackbar(
          '코인 ${coin}개 돌파',
          '축하합니다!',
        );
      }
      print('코인 변경감지: ${coin}');
    });

    print('appController 생성됨');
  }
}
