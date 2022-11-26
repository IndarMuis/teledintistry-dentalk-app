import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/modules/e_resep_dokter/views/widgets/e_resep_dokter_header.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/e_resep_dokter_controller.dart';

class EResepDokterView extends GetView<EResepDokterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Obx(
              () => (controller.isLoading.isTrue)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : ListView(
                      children: [
                        EResepDokterHeader(),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "From : ${controller.dataDokter['nama_dokter']}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 17,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "To : ",
                          style: primaryTextStyle.copyWith(
                            fontSize: 17,
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
                              border:
                                  Border.all(width: 1.5, color: primaryColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nama : ${controller.dataPasien['username']}",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Umur : ${controller.dataPasien['umur']}",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      "Telepon : ${controller.dataPasien['telepon']}",
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
                              Icon(
                                Icons.medical_services,
                                size: 50,
                                color: primaryColor,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 1.3,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child:
                                    (controller.documentName.value.isNotEmpty)
                                        ? Text(
                                            "${controller.documentName.value}",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: light,
                                              color: primaryColor,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : Text(
                                            "Upload resep (PDF Document)",
                                            style: secondaryTextStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: light,
                                                fontStyle: FontStyle.italic),
                                          ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.pilihResep();
                              },
                              child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Icon(
                                    Icons.file_open,
                                    color: backgroundColor,
                                    size: 30,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
            )),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
          child: Obx(() => (controller.documentPath.value.isEmpty)
              ? ElevatedButton(
                  onPressed: () {
                    errorSnackBar(
                        title: "Gagal Mengirim Resep",
                        message:
                            "Silahkan masukkan file resep terlebih dahulu");
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      elevation: 0,
                      primary: secondaryTextColor.withOpacity(0.5),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width / 2, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Text(
                    "Kirim",
                    style: primaryTextStyle.copyWith(
                        color: backgroundColor,
                        fontSize: 20,
                        fontWeight: semiBold),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    controller.kirimResep();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      elevation: 0,
                      primary: primaryColor,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width / 2, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: (controller.isLoading.isTrue)
                      ? Center(
                          child: CircularProgressIndicator(
                            color: backgroundColor,
                          ),
                        )
                      : Text(
                          "Kirim",
                          style: primaryTextStyle.copyWith(
                              color: backgroundColor,
                              fontSize: 20,
                              fontWeight: semiBold),
                        ),
                )),
        ),
      ),
    );
  }
}
