import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/controllers/cloud_firestore.dart';
import 'package:chat_app/utils/splash_screen.dart';
import 'package:chat_app/routes/name_route.dart';
import 'package:chat_app/routes/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({super.key});
  final authC = Get.put(AuthController(), permanent: true);
  final cloudC = Get.put(CloudFirestore());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<User?>(
              stream: authC.streamAuthStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.data != null && snapshot.data!.emailVerified) {
                    return FutureBuilder(
                        future: cloudC.readDataUserByDoc(),
                        builder: (context, snapshot) {
                          return GetMaterialApp(
                              debugShowCheckedModeBanner: false,
                              initialRoute: NameRoute.chatPage,
                              getPages: RoutePageApp.pages);
                        });
                  } else {
                    return GetMaterialApp(
                        debugShowCheckedModeBanner: false,
                        initialRoute: NameRoute.loginPage,
                        getPages: RoutePageApp.pages);
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              });
        }
        return const SplashScreen();
      },
    );
  }
}
