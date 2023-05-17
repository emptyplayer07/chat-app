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

  void addData(String email, String nama) async {
    try {
      final userCredential = FirebaseAuth.instance.currentUser;
      CollectionReference addData =
          firebaseFirestore.collection("${getDataUser()}");

      await addData.add({
        "nama": nama,
        "email": email,
        "createdAt": userCredential!.metadata.creationTime!.toIso8601String(),
      });
    } catch (e) {
      Get.defaultDialog(title: "warning", middleText: "$e");
    }
  }
}
