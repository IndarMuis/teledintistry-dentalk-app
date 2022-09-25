import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/pasien_terdaftar/controllers/pasien_terdaftar_controller.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

class PasienTerdaftarView extends GetView<PasienTerdaftarController> {
  final controller = Get.put(PasienTerdaftarController());
  @override
  Widget build(BuildContext context) {
    Widget pasienCard({
      String? nama,
      String? umur,
      String? alamat,
      String? program,
      String? tanggalDaftar,
    }) {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${nama}",
                        style: primaryTextStyle.copyWith(
                          fontSize: 17,
                          fontWeight: semiBold,
                          color: backgroundColor,
                        ),
                      ),
                      Text(
                        "Umur : ${umur} Tahun",
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          color: backgroundColor,
                        ),
                      ),
                      Text(
                        "Alamat : ${alamat}",
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          color: backgroundColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(bottom: 35),
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "${program}",
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: primaryColor,
                          fontWeight: bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Obx(() => (controller.isLoading.isTrue)
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: double.infinity,
                        padding: EdgeInsets.all(defaultMargin),
                        color: primaryColor,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Screening",
                            style: primaryTextStyle.copyWith(
                              fontSize: 23,
                              color: backgroundColor,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(defaultMargin),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 0.5,
                            )
                          ],
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(
                            top: 100,
                            left: defaultMargin,
                            right: defaultMargin,
                            bottom: 50),
                        width: double.infinity,
                        child: (controller.daftarPasien.isEmpty)
                            ? Center(
                                child: Text(
                                "Saat ini anda belum memiliki pasien",
                                style: secondaryTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ))
                            : ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: controller.daftarPasien.map((data) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_PASIEN,
                                          arguments: data['pasien']['id_user']);
                                      print(data['pasien']['id_user']);
                                    },
                                    child: pasienCard(
                                      nama: data['pasien']['nama_pasien'],
                                      umur: data['pasien']['umur_pasien'],
                                      alamat: data['pasien']['alamat_pasien'],
                                      program: data['program']['nama_program'],
                                      tanggalDaftar: data['program']
                                          ['tanggal_daftar_program'],
                                    ),
                                  );
                                }).toList(),
                              ),
                      )
                    ],
                  )
                ],
              )),
      ),
    );
  }
}
