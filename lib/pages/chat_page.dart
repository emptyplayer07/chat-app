import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/routes/name_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final List<Widget> myChat = List.generate(
        20,
        (index) => ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: const Text("Nama"),
              subtitle: Text("Keterangan ${index + 1}"),
            )).reversed.toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Chats",
                      style: TextStyle(fontSize: 20),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                      child: InkWell(
                        radius: 100,
                        onTap: () {
                          Get.toNamed(NameRoute.profilePage);
                        },
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: myChat.length,
              itemBuilder: (context, index) => myChat[index],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(NameRoute.searchPersonPage);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
