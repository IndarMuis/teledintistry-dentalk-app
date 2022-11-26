import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/list_doctor/views/widgets/list_doctor_header.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/list_doctor_controller.dart';

class ListDoctorView extends GetView<ListDoctorController> {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(defaultMargin),
                children: [
                  ListDoctorHeader(),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: controller.dataDokter.map((data) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_PROFILE_DOKTER,
                                arguments: data['id_dokter']);
                          },
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(data['image_dokter']),
                                  fit: BoxFit.fitHeight,
                                )),
                          ),
                          title: Text(
                            data['nama_dokter'],
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(data['jabatan_dokter']),
                          trailing: Icon(
                            Icons.arrow_right,
                            size: 40,
                            color: primaryColor,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              )),
      ),
    );
  }
}
