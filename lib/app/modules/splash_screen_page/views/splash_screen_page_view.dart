import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/splash_screen_page_controller.dart';

class SplashScreenPageView extends GetView<SplashScreenPageController> {
  final controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo_splashScreen.png",
                width: 250,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'DENTALK',
                  style: primaryTextStyle.copyWith(
                      fontSize: 40, fontWeight: semiBold, color: primaryColor),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 150,
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              Text(
                "Powered By :",
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo_fkg.png",
                    width: 70,
                  ),
                  Text(
                    "RSIGM FKG UMI",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                        color: Color(0xffF39A0E)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
