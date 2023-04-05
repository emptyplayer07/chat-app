import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxtChatRoomController extends GetxController {
  late TextEditingController fieldChat;

  @override
  void onInit() {
    fieldChat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fieldChat.dispose();
    super.onClose();
  }
}
