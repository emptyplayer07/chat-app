import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxtSearchPersonController extends GetxController {
  late TextEditingController fieldSearch;

  @override
  void onInit() {
    fieldSearch = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fieldSearch.dispose();
    super.onClose();
  }
}
