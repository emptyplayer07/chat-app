import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: Get.width * 0.7,
            height: Get.height * 0.7,
            child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_KEahK5k9Mf.json'),
          ),
        ),
      ),
    );
  }
}
