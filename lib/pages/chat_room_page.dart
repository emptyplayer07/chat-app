import 'package:chat_app/controllers/textfield/chat_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final txtChatC = Get.put(TxtChatRoomController());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_back,
              ),
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Nama",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Email",
            style: TextStyle(fontSize: 10),
          ),
        ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  itemChat(
                    isSender: true,
                  ),
                  itemChat(
                    isSender: false,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: Get.width,
            //margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: txtChatC.fieldChat,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.send),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class itemChat extends StatelessWidget {
  const itemChat({super.key, required this.isSender});

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: isSender
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        )
                      : const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        )),
              child: const Text(
                "Haloaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Text("18.00"),
          ],
        ),
      ),
    );
  }
}
