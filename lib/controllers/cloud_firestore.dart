import 'package:firebase_auth/firebase_auth.dart'; // FirebaseAuth
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart'; //CloudFirestore

class CloudFirestore extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel userModel = UserModel();

  getDataUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final currentUser = user.email;
      return currentUser;
    }
  }

  readDataUserByDoc() async {
    CollectionReference user = firestore.collection("users");
    final userByDoc = await user.doc("${getDataUser()}").get();
    final currUserByDoc = userByDoc.data() as Map<String, dynamic>;
    userModel = UserModel(
      uid: currUserByDoc['uid'],
      nama: currUserByDoc['nama'],
      email: currUserByDoc['email'],
    );
    return userModel;
  }

  void addDataUsersByRegis(String email, String nama) async {
    try {
      final userCredential = FirebaseAuth.instance.currentUser;
      CollectionReference addData = firestore.collection("users");

      await addData.doc("${getDataUser()}").set({
        "uid": userCredential!.uid,
        "nama": nama,
        "email": email,
        "createdAt": userCredential.metadata.creationTime!.toIso8601String(),
      });
    } catch (e) {
      Get.defaultDialog(title: "warning", middleText: "$e");
    }
  }
}
