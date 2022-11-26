import 'dart:async';

import 'package:get/get.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class SplashScreenPageController extends GetxController {
  //TODO: Implement SplashScreenPageController

  final count = 0.obs;
  @override
  void onInit() {
    print("object");
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => SecondScreen())));

    Timer(
        Duration(seconds: 2),
        () => Get.offAllNamed(
              Routes.LOGIN,
            ));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
