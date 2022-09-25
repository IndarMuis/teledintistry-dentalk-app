import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/complete_daftar_program/views/widgets/complete_daftar_program_header.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/complete_daftar_program_controller.dart';

class CompleteDaftarProgramView
    extends GetView<CompleteDaftarProgramController> {
  final controller = Get.put(CompleteDaftarProgramController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              CompleteDaftarProgramHeader(),
              SizedBox(
                height: 50,
              ),
              Text(
                "Pilih Dokter",
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => (controller.isLoading.value)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : DropdownButtonFormField(
                      menuMaxHeight: 350,
                      elevation: 2,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: secondaryTextColor,
                        hintStyle: secondaryTextStyle,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Colors.white, style: BorderStyle.none)),
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                      hint: Text(
                        "Select",
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: light,
                        ),
                      ),
                      items: controller.listDokter.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              Image.network(
                                "${e['image_dokter']}",
                                width: 30,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text(e['nama_dokter']),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.listDokterValue.value = value as Map;
                        print(controller.listDokterValue);
                      })),
              SizedBox(
                height: 30,
              ),
              Text(
                "Pilihan Program",
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => (controller.isLoading.value)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : Container(
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
                                "Program ${controller.dataProgram['nama_program']}",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                "Waktu pemeriksaan ${controller.dataProgram['waktu_pemeriksaan_program']}",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                "Jadwal Pemeriksaan ${controller.dataProgram['jadwal_pemeriksaan_program']}",
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
                            Icons.medical_services,
                            size: 60,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 25),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                    primary: backgroundColor,
                    padding: EdgeInsets.all(13),
                    elevation: 0,
                    minimumSize: Size(
                        MediaQuery.of(context).size.width / 2 - defaultMargin,
                        30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: primaryColor, width: 1.5))),
                child: Text(
                  "Batal",
                  style: primaryTextStyle.copyWith(
                      fontWeight: semiBold, color: primaryColor, fontSize: 20),
                ),
              ),
              Obx(() => ElevatedButton(
                    onPressed: () {
                      controller.daftar();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: EdgeInsets.all(13),
                        elevation: 0,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width / 2 -
                                defaultMargin,
                            30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: (controller.isLoading.isTrue)
                        ? Center(
                            child: CircularProgressIndicator(
                              color: backgroundColor,
                            ),
                          )
                        : Text(
                            "Daftar",
                            style: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                                color: backgroundColor,
                                fontSize: 20),
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
