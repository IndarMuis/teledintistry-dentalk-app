import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/odontogram/views/widgets/odontogram_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/odontogram_controller.dart';

class OdontogramView extends GetView<OdontogramController> {
  final controller = Get.put(OdontogramController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() => Padding(
              padding: EdgeInsets.all(15),
              child: (controller.isLoading.isTrue)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : ListView(
                      children: [
                        OdontogramHeader(),
                        SizedBox(
                          height: 40,
                        ),
                        // BARIS 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            odontogramCard(
                                id: 18,
                                odontogram: controller.odontogramPasien['18']),
                            odontogramCard(
                              id: 17,
                              odontogram: controller.odontogramPasien['17'],
                            ),
                            odontogramCard(
                              id: 16,
                              odontogram: controller.odontogramPasien['16'],
                            ),
                            odontogramCard(
                              id: 15,
                              odontogram: controller.odontogramPasien['15'],
                            ),
                            odontogramCard(
                              id: 14,
                              odontogram: controller.odontogramPasien['14'],
                            ),
                            odontogramCard(
                              id: 13,
                              odontogram: controller.odontogramPasien['13'],
                            ),
                            odontogramCard(
                              id: 12,
                              odontogram: controller.odontogramPasien['12'],
                            ),
                            odontogramCard(
                              id: 11,
                              odontogram: controller.odontogramPasien['11'],
                            ),
                            odontogramCard(
                              id: 21,
                              odontogram: controller.odontogramPasien['21'],
                            ),
                            odontogramCard(
                              id: 22,
                              odontogram: controller.odontogramPasien['22'],
                            ),
                            odontogramCard(
                              id: 23,
                              odontogram: controller.odontogramPasien['23'],
                            ),
                            odontogramCard(
                              id: 24,
                              odontogram: controller.odontogramPasien['24'],
                            ),
                            odontogramCard(
                              id: 25,
                              odontogram: controller.odontogramPasien['25'],
                            ),
                            odontogramCard(
                              id: 26,
                              odontogram: controller.odontogramPasien['26'],
                            ),
                            odontogramCard(
                              id: 27,
                              odontogram: controller.odontogramPasien['27'],
                            ),
                            odontogramCard(
                              id: 28,
                              odontogram: controller.odontogramPasien['28'],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // BARIS 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            odontogramCard(
                                id: 55,
                                odontogram: controller.odontogramPasien['55']),
                            odontogramCard(
                                id: 54,
                                odontogram: controller.odontogramPasien['54']),
                            odontogramCard(
                                id: 53,
                                odontogram: controller.odontogramPasien['53']),
                            odontogramCard(
                                id: 52,
                                odontogram: controller.odontogramPasien['52']),
                            odontogramCard(
                                id: 51,
                                odontogram: controller.odontogramPasien['51']),
                            odontogramCard(
                                id: 61,
                                odontogram: controller.odontogramPasien['61']),
                            odontogramCard(
                                id: 62,
                                odontogram: controller.odontogramPasien['62']),
                            odontogramCard(
                                id: 63,
                                odontogram: controller.odontogramPasien['63']),
                            odontogramCard(
                                id: 64,
                                odontogram: controller.odontogramPasien['64']),
                            odontogramCard(
                                id: 65,
                                odontogram: controller.odontogramPasien['65']),
                          ],
                        ),
                        SizedBox(height: 20),
                        // BARIS 3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            odontogramCard(
                                id: 85,
                                odontogram: controller.odontogramPasien['85']),
                            odontogramCard(
                                id: 84,
                                odontogram: controller.odontogramPasien['84']),
                            odontogramCard(
                                id: 83,
                                odontogram: controller.odontogramPasien['83']),
                            odontogramCard(
                                id: 82,
                                odontogram: controller.odontogramPasien['82']),
                            odontogramCard(
                                id: 81,
                                odontogram: controller.odontogramPasien['81']),
                            odontogramCard(
                                id: 71,
                                odontogram: controller.odontogramPasien['71']),
                            odontogramCard(
                                id: 72,
                                odontogram: controller.odontogramPasien['72']),
                            odontogramCard(
                                id: 73,
                                odontogram: controller.odontogramPasien['73']),
                            odontogramCard(
                                id: 74,
                                odontogram: controller.odontogramPasien['74']),
                            odontogramCard(
                                id: 75,
                                odontogram: controller.odontogramPasien['75']),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // BARIS 4
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            odontogramCard(
                                id: 48,
                                odontogram: controller.odontogramPasien['48']),
                            odontogramCard(
                              id: 47,
                              odontogram: controller.odontogramPasien['47'],
                            ),
                            odontogramCard(
                              id: 46,
                              odontogram: controller.odontogramPasien['46'],
                            ),
                            odontogramCard(
                              id: 45,
                              odontogram: controller.odontogramPasien['45'],
                            ),
                            odontogramCard(
                              id: 44,
                              odontogram: controller.odontogramPasien['44'],
                            ),
                            odontogramCard(
                              id: 43,
                              odontogram: controller.odontogramPasien['43'],
                            ),
                            odontogramCard(
                              id: 42,
                              odontogram: controller.odontogramPasien['42'],
                            ),
                            odontogramCard(
                              id: 41,
                              odontogram: controller.odontogramPasien['41'],
                            ),
                            odontogramCard(
                              id: 31,
                              odontogram: controller.odontogramPasien['31'],
                            ),
                            odontogramCard(
                              id: 32,
                              odontogram: controller.odontogramPasien['32'],
                            ),
                            odontogramCard(
                              id: 33,
                              odontogram: controller.odontogramPasien['33'],
                            ),
                            odontogramCard(
                              id: 34,
                              odontogram: controller.odontogramPasien['34'],
                            ),
                            odontogramCard(
                              id: 35,
                              odontogram: controller.odontogramPasien['35'],
                            ),
                            odontogramCard(
                              id: 36,
                              odontogram: controller.odontogramPasien['36'],
                            ),
                            odontogramCard(
                              id: 37,
                              odontogram: controller.odontogramPasien['37'],
                            ),
                            odontogramCard(
                              id: 38,
                              odontogram: controller.odontogramPasien['38'],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Ubah Skema Odontogram",
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: controller.nomorOdontogram,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          decoration: InputDecoration(
                            counterText: "",
                            fillColor: Colors.white,
                            hintText: "Nomor Odontogram",
                            focusColor: secondaryTextColor,
                            hintStyle: secondaryTextStyle,
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.none)),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "TO",
                            style: primaryTextStyle.copyWith(
                                fontSize: 13, fontWeight: bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                            menuMaxHeight: 350,
                            elevation: 2,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: secondaryTextColor,
                              hintStyle: secondaryTextStyle,
                              border: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.none)),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                            hint: Text("Pilih Gambar"),
                            items: controller.pilihan.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      e['image'],
                                      width: 30,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(e['name']),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.odontogramValue.value = value as Map;
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addNewOdontogram();
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                backgroundColor: Colors.white,
                                elevation: 0,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width / 2.5,
                                    50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                      color: primaryColor,
                                    ))),
                            child: Text(
                              "Submit Perubahan",
                              style: primaryTextStyle.copyWith(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: semiBold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Perubahan Odontogram",
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),

                        // PERUBAHAN ODONTOGRAM
                        (controller.daftarPerubahanOdontogram.isEmpty)
                            ? SizedBox()
                            : Obx(() => Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: controller
                                        .daftarPerubahanOdontogram
                                        .map((data) {
                                      print(data);
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("${data['id']}",
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 20,
                                                )),
                                            Icon(
                                              Icons.double_arrow_rounded,
                                              color: primaryColor,
                                              size: 30,
                                            ),
                                            Image.asset(
                                              "${data['image']}",
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )),
                      ],
                    ),
            )),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            bottom: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Obx(() => (controller.daftarPerubahanOdontogram.isEmpty)
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      elevation: 0,
                      side: BorderSide(width: 1, color: primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {
                    Get.offAllNamed(Routes.MAIN_DOCTOR);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.keyboard_double_arrow_left,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Kembali",
                        style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            color: primaryColor,
                            fontSize: 18),
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.daftarPerubahanOdontogram.value = [];
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          padding: EdgeInsets.all(10),
                          elevation: 0,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 -
                                  defaultMargin * 2,
                              50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: Text(
                        "Reset",
                        style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            color: backgroundColor,
                            fontSize: 15),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Simpan rekam media pasien?",
                            titleStyle: primaryTextStyle.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                            titlePadding: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 10),
                            contentPadding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 20),
                            content: Column(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: primaryColor.withOpacity(0.7),
                                  size: 75,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 30),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: BorderSide(
                                                color: errorColor,
                                              ))),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "Batal",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          color: errorColor,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: TextButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: primaryColor,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 30),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )),
                                      onPressed: () {
                                        controller.saveOdontogram();
                                      },
                                      child: Text(
                                        "Simpan",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          color: backgroundColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.all(10),
                          elevation: 0,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 -
                                  defaultMargin * 2,
                              50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: Center(
                        child: Text(
                          "Simpan",
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              color: backgroundColor,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                )),
        ),
      ),
    );
  }

  Column odontogramCard({int? id, String? odontogram}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "$odontogram",
          height: 21,
          width: 21,
        ),
        Text(
          "${id}",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 10),
        )
      ],
    );
  }
}
