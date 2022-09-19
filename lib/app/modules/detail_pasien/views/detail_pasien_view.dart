import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teledintistry/app/modules/detail_pasien/views/widgets/detail_pasien_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/detail_pasien_controller.dart';

class DetailPasienView extends GetView<DetailPasienController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Obx(() => (controller.isLoading.isTrue)
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: ListView(
                  children: [
                    DetailPasienHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Data Pasien",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1.5, color: primaryColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama : ${controller.dataPasien['pasien']['nama_pasien']}",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                "Umur : ${controller.dataPasien['pasien']['umur_pasien']} Tahun",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                "Telepon : ${controller.dataPasien['pasien']['telepon_pasien']}",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.person_pin_rounded,
                            size: 60,
                            color: primaryColor.withOpacity(0.8),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Program",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1.5, color: primaryColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Program : ${controller.dataPasien['program']['nama_program']}",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: bold,
                                  ),
                                ),
                                Text(
                                  "Pendaftaran : ${controller.dataPasien['program']['tanggal_daftar_program']}",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: medium,
                                  ),
                                ),
                                Text(
                                  "Waktu Pemeriksaan : ${controller.dataPasien['program']['waktu_pemeriksaan_program']}",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.medical_services,
                              size: 60,
                              color: primaryColor.withOpacity(0.8),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tindakan",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "E-Resep",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 15, fontWeight: semiBold),
                              ),
                              (controller.dataPasien['notifikasi']['resep'] !=
                                      null)
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 25,
                                      color: primaryColor,
                                    )
                                  : Icon(
                                      Icons.file_copy_rounded,
                                      size: 25,
                                      color: primaryColor,
                                    )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              (controller.dataPasien['notifikasi']['resep'] !=
                                      null)
                                  ? Expanded(
                                      child: Text(
                                        "fileresep.pdf",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                          color: primaryColor,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : SizedBox(),
                              (controller.dataPasien['notifikasi']['resep'] !=
                                      null)
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          elevation: 1,
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: BorderSide(
                                                  color: primaryColor))),
                                      child: Text(
                                        "Update Resep",
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                          color: primaryColor,
                                        ),
                                      ))
                                  : ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.E_RESEP_DOKTER,
                                            arguments: {
                                              "id_user": Get.arguments
                                            });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 1,
                                          primary: primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: BorderSide(
                                                  color: primaryColor))),
                                      child: Text(
                                        "Tambah Resep",
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                          color: backgroundColor,
                                        ),
                                      )),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rujukan",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 15, fontWeight: semiBold),
                              ),
                              (controller.dataPasien['notifikasi']['rujukan'] !=
                                      null)
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 25,
                                      color: primaryColor,
                                    )
                                  : Icon(
                                      Icons.file_copy_rounded,
                                      size: 25,
                                      color: primaryColor,
                                    )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              (controller.dataPasien['notifikasi']['rujukan'] !=
                                      null)
                                  ? Expanded(
                                      child: Text(
                                        "fileresep.pdf",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                          color: primaryColor,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  : SizedBox(),
                              (controller.dataPasien['notifikasi']['rujukan'] !=
                                      null)
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          elevation: 1,
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: BorderSide(
                                                  color: primaryColor))),
                                      child: Text(
                                        "Update Surat",
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                          color: primaryColor,
                                        ),
                                      ))
                                  : ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.RUJUKAN, arguments: {
                                          "id_user": Get.arguments
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 1,
                                          primary: primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: BorderSide(
                                                  color: primaryColor))),
                                      child: Text(
                                        "Kirim Rujukan",
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: semiBold,
                                          color: backgroundColor,
                                        ),
                                      )),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.ODONTOGRAM,
                              arguments: {"id_user": Get.arguments});
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Colors.white,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: primaryColor)),
                        ),
                        child: Text(
                          "Lihat Odontogram",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                            color: primaryColor,
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: errorColor,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          "Hentikan Program",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                            color: backgroundColor,
                          ),
                        ))
                  ],
                ),
              )),
      ),
    );
  }
}
