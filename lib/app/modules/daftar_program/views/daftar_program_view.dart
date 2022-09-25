import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/daftar_program/views/widgets/daftar_program_header.dart';
import 'package:teledintistry/app/modules/daftar_program/views/widgets/daftar_program_card.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

import '../../../theme.dart';
import '../controllers/daftar_program_controller.dart';

class DaftarProgramView extends GetView<DaftarProgramController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Obx(() => (controller.isLoading.isTrue)
            ? Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: ListView(
                  children: [
                    DaftarProgramHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: ListView(
                  children: [
                    DaftarProgramHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    // Material(
                    //   shadowColor: primaryColor.withOpacity(0.5),
                    //   elevation: 5,
                    //   borderRadius: BorderRadius.all(Radius.circular(20)),
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //       fillColor: backgroundColor,
                    //       hintText: "Search Program",
                    //       suffixIcon: Icon(
                    //         Icons.search,
                    //         size: 25,
                    //       ),
                    //       suffixIconColor: secondaryTextColor,
                    //       hintStyle: secondaryTextStyle,
                    //       border: UnderlineInputBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(25)),
                    //           borderSide: BorderSide(
                    //               color: Colors.white,
                    //               style: BorderStyle.none)),
                    //       filled: true,
                    //       contentPadding: EdgeInsets.all(15),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    Text("All Program",
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: controller.allProgram.map((data) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.INFO_PROGRAM,
                              arguments: data['nama_program'],
                            );
                          },
                          child: DaftarProgramCard(
                              programName: data['nama_program']!,
                              programImage: data['image_program']!),
                        );
                      }).toList(),
                    )
                  ],
                ),
              )),
      ),
    );
  }
}
