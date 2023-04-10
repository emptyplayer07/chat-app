import 'package:chat_app/routes/name_route.dart';
import 'package:firebase_auth/firebase_auth.dart'; //FirebaseAuth
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Google Sign In

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus() {
    return FirebaseAuth.instance.authStateChanges();
  }

  getDataUser() {
    final user = auth.currentUser;
    if (user != null) {
      var emailUser = user.email;
      return emailUser;
    }
  }

  void login(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        Get.offAllNamed(NameRoute.chatPage);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "email anda belum di verifikasi",
          onConfirm: () {
            credential.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Konfirmasi ulang?",
          onCancel: () {},
          textCancel: "Tidak",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Warning",
          "email belum terdaftar",
          duration: const Duration(seconds: 1),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Warning",
          "password salah",
          duration: const Duration(seconds: 1),
        );
      }
    }
  }

  void register(String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Warning",
        middleText: "Kami sudah mengirimkan email verification ke $email",
        onConfirm: () {
          Get.back();
          Get.back();
        },
        textConfirm: "Ya, saya mengerti",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Warning",
          "password terlalu lemah",
          duration: const Duration(seconds: 1),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Warning",
          "email $email sudah pernah digunakan",
          duration: const Duration(seconds: 1),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(NameRoute.loginPage);
  }
}
