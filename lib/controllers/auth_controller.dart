import 'package:chat_app/routes/name_route.dart';
import 'package:firebase_auth/firebase_auth.dart'; //FirebaseAuth
import 'package:get/get.dart';

class AuthController extends GetxController {
  Stream<User?> streamAuthStatus() {
    return FirebaseAuth.instance.authStateChanges();
  }

  void login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(NameRoute.chatPage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void register(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Silahkan coba login ",
        onConfirm: () {
          Get.back();
          Get.back();
        },
        textConfirm: "Oke",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
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
