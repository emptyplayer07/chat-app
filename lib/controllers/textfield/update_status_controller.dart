import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxtUpdateStatusController extends GetxController {
  late TextEditingController fieldStatus;

  @override
  void onInit() {
    fieldStatus = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fieldStatus.dispose();
    super.onClose();
  }
}
