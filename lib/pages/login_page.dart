import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/controllers/textfield/login_controller.dart';
import 'package:chat_app/routes/name_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginC = Get.find<LoginController>();
    final authC = Get.find<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Center(
                child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
              ),
            )),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: loginC.email,
              decoration: const InputDecoration(
                labelText: "email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: loginC.password,
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
                authC.login(loginC.email.text, loginC.password.text);
              },
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(child: Text("Belum Punya Akun?")),
            TextButton(
                onPressed: () {
                  Get.toNamed(NameRoute.registerPage);
                },
                child: const Text("Register")),
            // const Center(child: Text("______________")),
            // ElevatedButton(
            //   onPressed: () {
            //     authC.loginWithGoogleSignInCoba();
            //   },
            //   child: const Text("Sign in with Google"),
            // ),
          ],
        ),
      ),
    );
  }
}
