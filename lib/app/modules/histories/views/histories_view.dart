import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/histories/views/detail_history_view.dart';
import 'package:teledintistry/app/modules/histories/views/widgets/histories_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/histories_controller.dart';

class HistoriesView extends GetView<HistoriesController> {
  var controller = Get.put(HistoriesController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              HistoriesHeader(),
              SizedBox(
                height: 50,
              ),
              (controller.data.isEmpty)
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        Center(
                          child: Text(
                            "Belum Ada Riwayat Program",
                            style: secondaryTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => DetailHistoryView());
                      },
                      child: historyCard(
                        namaProgram: controller.data['program']['nama_program'],
                        namaDokter: controller.data['dokter']['nama_dokter'],
                        durasiPemeriksaan: controller.data['program']
                            ['waktu_pemeriksaan_program'],
                        tanggalDaftar: controller.data['program']
                            ['tanggal_daftar_program'],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Material historyCard(
      {String? tanggalDaftar,
      String? namaDokter,
      String? durasiPemeriksaan,
      String? namaProgram}) {
    return Material(
      shadowColor: secondaryTextColor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(15),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${namaProgram}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  "${tanggalDaftar}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Dokter : ${namaDokter}",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Durasi Pemeriksaan : ${durasiPemeriksaan}",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
