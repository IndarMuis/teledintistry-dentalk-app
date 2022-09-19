import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/modules/notifikasi/views/widgets/notifikasi_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
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
                    NotifikasiHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      shadowColor: secondaryTextColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(
                              color: primaryColor,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "E-Resep",
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "From : ${controller.dataNotifikasi['dokter']['nama_dokter']}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Document : ${controller.dataNotifikasi['notifikasi']['resep']['nama_file']}",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      color: primaryColor,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: BorderSide(color: primaryColor),
                                        )),
                                    onPressed: () {
                                      Get.toNamed(Routes.VIEW_FILE_PDF,
                                          arguments: {
                                            "title": "E-Resep",
                                            "file": controller.dataNotifikasi[
                                                'notifikasi']['resep']
                                          });
                                    },
                                    child: Text(
                                      "Open",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: semiBold,
                                        color: primaryColor,
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      print(
                                          "${controller.dataNotifikasi['notifikasi']['resep']['file_resep']}");
                                      dialogVerification(
                                          onConfirm: () {
                                            controller.openFile(
                                                url: controller.dataNotifikasi[
                                                        'notifikasi']['resep']
                                                    ['file_resep'],
                                                fileName:
                                                    controller.dataNotifikasi[
                                                            'notifikasi']
                                                        ['resep']['nama_file']);
                                          },
                                          title: "Download File",
                                          icon: Icons.download,
                                          color: primaryColor,
                                          isLoading:
                                              controller.isLoading.value);
                                    },
                                    icon: Icon(
                                      Icons.download,
                                      size: 38,
                                      color: primaryColor,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}
