import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/detail_profile_dokter/views/widgets/detail_profile_dokter_header.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/detail_profile_dokter_controller.dart';

class DetailProfileDokterView extends GetView<DetailProfileDokterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Obx(() => (controller.isLoading.isTrue)
              ? Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              : ListView(
                  children: [
                    DetailProfileDokterHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        Center(
                          child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(controller
                                        .dataDokter['image_dokter']))),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          controller.dataDokter['nama_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.dataDokter['jabatan_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.dataDokter['umur_dokter'] + " Tahun",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "No. STR : " +
                              controller.dataDokter['nomor_str_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "No. SIP : " +
                              controller.dataDokter['nomor_sip_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Jenis Kelamin : " +
                              controller.dataDokter['jenis_kelamin_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Tempat Tanggal Lahir : " +
                              controller.dataDokter['tempat_lahir_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Email : " + controller.dataDokter['email_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nomor Telepon : " +
                              controller.dataDokter['nomor_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Kewarganegaraan : " +
                              controller.dataDokter['kewarganegaraan_dokter'],
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              "Jadwal : ",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: semiBold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (controller
                                            .dataDokter['jadwal_praktek_dokter']
                                        as List)
                                    .map((data) {
                                  return Text(
                                    " - " + data,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: semiBold,
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )),
        ),
      ),
    );
  }
}
