import 'package:chat_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      body: const Center(
        child: Text("Chat Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => authC.logout(),
      ),
    );
  }
}
