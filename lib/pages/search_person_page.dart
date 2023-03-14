import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPersonPage extends StatelessWidget {
  const SearchPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        Get.snackbar("Warning", "Nama tidak ditemukan",
                            duration: const Duration(seconds: 2));
                      },
                      icon: const Icon(Icons.search)),
                  hintText: "cari teman anda...",
                  border: const OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
