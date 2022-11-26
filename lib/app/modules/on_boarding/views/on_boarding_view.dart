import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
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
                "assets/logo_onBoarding.png",
                width: 180,
                height: 180,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Hey! Selamat Datang',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Sistem Teledentistry dapat meningkatkan diagnosis diri, memfasilitasi pengobatan penyakit gigi dan mulut tepat waktu, mempermudah komunikasi antar tenaga kesehatan dan pasien, serta memperluas akses perawatan kepada masyarakat.',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Obx(() => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      elevation: 0,
                      primary: primaryColor,
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    controller.addImage();
                  },
                  child: (controller.isLoading.isTrue)
                      ? Center(
                          child: CircularProgressIndicator(
                            color: backgroundColor,
                            strokeWidth: 2.5,
                          ),
                        )
                      : Text(
                          "Daftar Sekarang",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                            color: backgroundColor,
                          ),
                        )))
            ],
          ),
        ),
      ),
    );
  }
}
