import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/empty_screen.dart';

class SearchPersonPage extends StatelessWidget {
  //const SearchPersonPage({super.key});
  final List<Widget> countFriend = List.generate(
      0,
      (index) => ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text("Candra"),
            subtitle: const Text("0852669851060"),
            trailing: GestureDetector(
              onTap: () {},
              child: const Chip(label: Text("chat +")),
            ),
          ));

  SearchPersonPage({super.key});

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
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(50),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        Get.snackbar("Warning", "Nama tidak ditemukan",
                            duration: const Duration(seconds: 2));
                      },
                      icon: const Icon(Icons.search)),
                  hintText: "cari teman anda...",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: countFriend.isNotEmpty
                  ? ListView.builder(
                      itemCount: countFriend.length,
                      itemBuilder: (context, index) {
                        return countFriend[index];
                      },
                    )
                  : const EmptyScreen(),
              //CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
