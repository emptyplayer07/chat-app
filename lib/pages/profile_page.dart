import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/controllers/cloud_firestore.dart';
import 'package:chat_app/routes/name_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cloudFirestoreC = Get.put(CloudFirestore());
    final authC = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authC.logout();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            AvatarGlow(
              endRadius: 100,
              glowColor: Colors.blue,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    image: const DecorationImage(
                      image: AssetImage("images/foto_profile.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${cloudFirestoreC.userModel.nama}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("${cloudFirestoreC.userModel.email}"),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(NameRoute.updateStatusPage);
                    },
                    leading: const Icon(Icons.note_add_outlined),
                    title: const Text("Update Status"),
                    trailing: const Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.color_lens),
                    title: const Text("Change Theme"),
                    trailing: const Text("Light"),
                  ),
                ],
              ),
            ),
            const Text("Version 1.0.0"),
          ],
        ),
      ),
    );
  }
}
