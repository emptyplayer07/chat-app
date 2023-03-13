import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/controllers/textfield/register_controller.dart';
import 'package:chat_app/routes/name_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerC = Get.find<RegisterController>();
    final authC = Get.put(AuthController());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Center(child: Text("Register")),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: registerC.email,
            decoration: const InputDecoration(
              labelText: "email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: registerC.password,
            decoration: const InputDecoration(
              labelText: "password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                authC.register(registerC.email.text, registerC.password.text);
              },
              child: const Text("Register")),
          const SizedBox(
            height: 30,
          ),
          const Center(child: Text("Sudah punya akun?")),
          TextButton(
            onPressed: () {
              Get.toNamed(NameRoute.loginPage);
            },
            child: const Text("Login"),
          ),
        ],
      ),
    ));
  }
}
