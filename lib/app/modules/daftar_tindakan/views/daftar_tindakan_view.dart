import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/daftar_tindakan/views/widgets/daftar_tindakan_card.dart';
import 'package:teledintistry/app/modules/daftar_tindakan/views/widgets/daftar_tindakan_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

import '../../../theme.dart';
import '../controllers/daftar_tindakan_controller.dart';

class DaftarTindakanView extends GetView<DaftarTindakanController> {
  @override
  Widget build(BuildContext context) {
    print(controller.daftarTindakan);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          padding: EdgeInsets.all(defaultMargin),
          children: [
            DaftarTindakanHeader(),
            SizedBox(
              height: 40,
            ),
            Obx(() => (controller.isLoading.isTrue)
                ? SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : Column(
                    children: controller.daftarTindakan
                        .map((data) => GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.INFO_PROGRAM,
                                    arguments: data['id_program']);
                              },
                              child: DaftarTindakanCard(
                                  namaTindakan: data['nama_program'],
                                  jenisProgram: data['jenis_program'],
                                  imageUrl: data['image_program']),
                            ))
                        .toList(),
                  ))
          ],
        ),
      ),
    );
  }
}
