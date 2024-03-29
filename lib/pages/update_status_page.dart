import 'package:chat_app/controllers/cloud_firestore.dart';
import 'package:chat_app/controllers/textfield/update_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusPage extends StatelessWidget {
  const UpdateStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final txtUpdSts = Get.put(TxtUpdateStatusController());
    final cloudFirestoreC = Get.put(CloudFirestore());

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          "Update Status",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: txtUpdSts.fieldStatus,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 30,
                ),
                labelText: "Status",
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              cursorColor: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text("Update Status"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
