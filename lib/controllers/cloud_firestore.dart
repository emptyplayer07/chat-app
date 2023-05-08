import 'package:firebase_auth/firebase_auth.dart'; // FirebaseAuth
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; //CloudFirestore

class CloudFirestore extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  getDataUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final currentUser = user.email;
      return currentUser;
    }
  }

  void addData() async {
    try {
      CollectionReference addData =
          firebaseFirestore.collection("${getDataUser()}");

      await addData.add({
        "nama": "candra",
        "umur": 25,
      });

      Get.defaultDialog(
        title: "Succes",
        middleText: "succces add data",
      );
    } catch (e) {
      Get.defaultDialog(title: "warning", middleText: "$e");
    }
  }
}
