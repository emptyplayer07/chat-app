import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.7,
      height: Get.height * 0.7,
      child: LottieBuilder.network(
          'https://assets6.lottiefiles.com/packages/lf20_dmw3t0vg.json'),
    );
  }
}
