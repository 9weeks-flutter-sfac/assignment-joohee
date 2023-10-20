import 'package:assignment1/view/author_page.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:assignment1/view/main_page.dart';
import 'package:assignment1/view/secret_page.dart';
import 'package:assignment1/view/setting_page.dart';
import 'package:assignment1/view/signup_page.dart';
import 'package:assignment1/view/start_page.dart';
import 'package:assignment1/view/upload_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: LoginPage.route,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: SignUpPage.route,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: MainPage.route,
      page: () => const MainPage(),
    ),
    GetPage(
      name: UploadPage.route,
      page: () => const UploadPage(),
    ),
    GetPage(
      name: SecretPage.route,
      page: () => const SecretPage(),
    ),
    GetPage(
      name: SettingPage.route,
      page: () => const SettingPage(),
    ),
    GetPage(
      name: StartPage.route,
      page: () => const StartPage(),
    ),
    GetPage(
      name: AuthorPage.route,
      page: () => const AuthorPage(),
    ),
  ];
}
