import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/modules/histories/controllers/histories_controller.dart';
import 'package:teledintistry/app/modules/histories/views/widgets/histories_header.dart';
import 'package:teledintistry/app/theme.dart';

class DetailHistoryView extends StatelessWidget {
  const DetailHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: GetBuilder<HistoriesController>(builder: (controller) {
            return ListView(
              children: [
                HistoriesHeader(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Profile",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama : ${controller.dataUser['username']}",
                            style: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: bold,
                            ),
                          ),
                          Text(
                            "Umur : ${controller.dataUser['umur']}",
                            style: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            "Telepon : ${controller.dataUser['telepon']}",
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
                        Icons.person_pin_sharp,
                        size: 60,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
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
                              "Program : ${controller.data['program']['nama_program']}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: bold,
                              ),
                            ),
                            Text(
                              "Pendaftaran : ${controller.data['program']['tanggal_daftar_program']}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                            ),
                            Text(
                              "Waktu Pemeriksaan : ${controller.data['program']['waktu_pemeriksaan_program']}",
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
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.5, color: primaryColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Dokter : ${controller.data['dokter']['nama_dokter']}",
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 30,
                // ),
                // Text(
                //   "Sisa waktu pemeriksaan program",
                //   style: primaryTextStyle.copyWith(
                //     fontSize: 18,
                //     fontWeight: bold,
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   padding: EdgeInsets.all(15),
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       border: Border.all(width: 1.5, color: primaryColor),
                //       borderRadius: BorderRadius.circular(15)),
                //   child: Center(
                //     child: Text(
                //       "Pemeriksaan : Per ${controller.data['program']['frekuensi_pemeriksaan_program']} minggu",
                //       style: primaryTextStyle.copyWith(
                //         fontSize: 15,
                //         fontWeight: bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          }),
        ),
        bottomNavigationBar:
            GetBuilder<HistoriesController>(builder: (controller) {
          return Container(
            height: 60,
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Obx(() => ElevatedButton(
                onPressed: () {
                  controller.hentikanProgram(
                      idProgram: controller.data['pasien']['id_user']);
                },
                style: ElevatedButton.styleFrom(
                    primary: backgroundColor,
                    padding: EdgeInsets.all(13),
                    elevation: 0,
                    minimumSize: Size(
                        MediaQuery.of(context).size.width / 2 - defaultMargin,
                        double.infinity),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: errorColor, width: 1.5))),
                child: (controller.isLoading.isTrue)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: errorColor,
                        ),
                      )
                    : Text(
                        "Hentikan Program",
                        style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            color: errorColor,
                            fontSize: 18),
                      ))),
          );
        }),
      ),
    );
  }
}
