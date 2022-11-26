import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/daftar_program/views/widgets/daftar_program_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

import '../../../theme.dart';
import '../controllers/daftar_program_controller.dart';
import 'widgets/program_card.dart';

class DaftarProgramView extends GetView<DaftarProgramController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Obx(() => (controller.isLoading.isTrue)
            ? Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: ListView(
                  children: [
                    DaftarProgramHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: ListView(
                  children: [
                    DaftarProgramHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    Text("All Program",
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {"jenis_program": "Konservasi Gigi"},
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Konservasi Gigi",
                              jumlahTindakan: 5),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {
                                "jenis_program": "Ortodontic (Kawat Gigi)"
                              },
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Ortodontic", jumlahTindakan: 1),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {
                                "jenis_program": "Radiologi Kedokteran Gigi"
                              },
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Radiologi Kedokteran Gigi",
                              jumlahTindakan: 2),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {
                                "jenis_program":
                                    "Bedah Mulut Maksilofacial (BM)"
                              },
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Bedah Mulut Maksilofacial",
                              jumlahTindakan: 4),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {"jenis_program": "Periodonsia"},
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Periodonsia", jumlahTindakan: 4),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {"jenis_program": "Pedodonsia"},
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Pedodonsia", jumlahTindakan: 5),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {"jenis_program": "Prostodonsia"},
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Prostodonsia", jumlahTindakan: 3),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.DAFTAR_TINDAKAN,
                              arguments: {
                                "jenis_program": "Penyakit Mulut (PM)"
                              },
                            );
                          },
                          child: ProgramCard(
                              namaProgram: "Penyakit Mulut", jumlahTindakan: 1),
                        ),
                      ],
                    )
                  ],
                ),
              )),
      ),
    );
  }
}
