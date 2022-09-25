import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/all_fitur_dokter/views/widgets/all_fitur_dokter_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/all_fitur_dokter_controller.dart';

class AllFiturDokterView extends GetView<AllFiturDokterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              AllFiturDokterHeader(),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PASIEN_TERDAFTAR);
                    },
                    child: programCard(
                        context: context,
                        programName: "Screening",
                        programIcon: Icons.search,
                        programColor: Colors.blue.shade300),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LIST_PASIEN,
                          arguments: {"from_page": "resep"});
                    },
                    child: programCard(
                        context: context,
                        programName: "E-Resep",
                        programIcon: Icons.receipt_rounded,
                        programColor: Colors.orange.shade300),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LIST_PASIEN,
                          arguments: {"from_page": "rujukan"});
                    },
                    child: programCard(
                        context: context,
                        programName: "Rujukan",
                        programIcon: Icons.today,
                        programColor: Colors.red.shade300),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LIST_PASIEN,
                          arguments: {"from_page": "odontogram"});
                    },
                    child: programCard(
                        context: context,
                        programName: "Odontogram",
                        programIcon: Icons.medical_services,
                        programColor: primaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container programCard(
      {required BuildContext context,
      required String programName,
      required IconData programIcon,
      required Color programColor}) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 2 - 2 * defaultMargin,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultMargin),
          color: programColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black26.withOpacity(0.1),
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(2, 2))
          ]),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              programIcon,
              size: 30,
              color: backgroundColor,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              programName,
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
                color: backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
