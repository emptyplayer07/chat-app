import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Halo"),
                          color: Colors.blue,
                        ),
                        Text("18.00"),
                      ],
                    ),
                    alignment: Alignment.centerRight,
                  )
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
