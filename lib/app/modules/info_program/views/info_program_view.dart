import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/info_program_controller.dart';

class InfoProgramView extends GetView<InfoProgramController> {
  @override
  Widget build(BuildContext context) {
    print(controller.dataProgram['image_program']);
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Obx(() => (controller.isLoading.isTrue)
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: primaryColor,
                  ),
                )
              : Stack(
                  children: [
                    Image.network(
                      "${controller.dataProgram['image_program']}",
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(defaultMargin),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                            child: Icon(
                          Icons.arrow_back_ios_new,
                        )),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23, vertical: 23),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: primaryColor,
                      ),
                      child: ListView(
                        children: [
                          Text(
                            "${controller.dataProgram['nama_program']}",
                            style: primaryTextStyle.copyWith(
                              fontSize: 30,
                              fontWeight: semiBold,
                              color: backgroundColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${controller.dataProgram['deskripsi_program']}",
                            style: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: light,
                              color: backgroundColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: backgroundColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(defaultMargin)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 50,
                                        color: backgroundColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${controller.dataProgram['jadwal_pemeriksaan_program']}",
                                        style: primaryTextStyle.copyWith(
                                            fontSize: 13,
                                            color: backgroundColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: backgroundColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(defaultMargin)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        size: 50,
                                        color: backgroundColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${controller.dataProgram['waktu_pemeriksaan_program']}",
                                        style: primaryTextStyle.copyWith(
                                            fontSize: 13,
                                            color: backgroundColor),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(
                                Routes.COMPLETE_DAFTAR_PROGRAM,
                                arguments: controller.dataProgram,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: backgroundColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            child: Text(
                              "Daftar Program",
                              style: primaryTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  color: primaryColor,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
    );
  }
}
