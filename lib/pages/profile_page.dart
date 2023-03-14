import 'package:chat_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Profil"),
          ),
          ElevatedButton(
            onPressed: () {
              authC.logout();
            },
            child: Text("Keluar"),
          )
        ],
      ),
    );
  }
}
