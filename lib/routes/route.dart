import 'package:chat_app/bindings/textfield/login_binding.dart';
import 'package:chat_app/bindings/textfield/register_binding.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/chat_room_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/profile_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/search_person_page.dart';
import 'package:chat_app/routes/name_route.dart';
import 'package:get/get.dart';

class RoutePageApp extends GetxController {
  static var pages = [
    //login page
    GetPage(
      name: NameRoute.loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    //register page
    GetPage(
      name: NameRoute.registerPage,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),

    //chat page
    GetPage(
      name: NameRoute.chatPage,
      page: () => const ChatPage(),
    ),

    //chat room page
    GetPage(
      name: NameRoute.chatRoomPage,
      page: () => const ChatRoomPage(),
    ),

    //profile page
    GetPage(
      name: NameRoute.profilePage,
      page: () => const ProfilePage(),
    ),

    //search friend page
    GetPage(
      name: NameRoute.searchPersonPage,
      page: () => SearchPersonPage(),
    )
  ];
}
