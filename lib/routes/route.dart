import 'package:chat_app/bindings/textfield/login_binding.dart';
import 'package:chat_app/bindings/textfield/register_binding.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/routes/name_route.dart';
import 'package:get/get.dart';

class RoutePageApp extends GetxController {
  static var pages = [
    GetPage(
      name: NameRoute.chatPage,
      page: () => const ChatPage(),
    ),
    GetPage(
      name: NameRoute.loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: NameRoute.registerPage,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    )
  ];
}
