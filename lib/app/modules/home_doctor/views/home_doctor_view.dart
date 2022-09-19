import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../../daftar_artikel/views/widgets/daftar_artikel_populer_card.dart';
import '../controllers/home_doctor_controller.dart';

class HomeDoctorView extends GetView<HomeDoctorController> {
  final controller = Get.put(HomeDoctorController());
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
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    floating: true,
                    snap: true,
                    backgroundColor: primaryColor,
                    expandedHeight: 200,
                    flexibleSpace: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        FlexibleSpaceBar(
                          background: Padding(
                            padding: EdgeInsets.all(defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Hai Dokter,",
                                          style: primaryTextStyle.copyWith(
                                              fontSize: 15,
                                              color: backgroundColor,
                                              fontWeight: light)),
                                      Text(
                                        "${controller.dataDokter['nama_dokter']}",
                                        style: primaryTextStyle.copyWith(
                                            fontSize: 18,
                                            color: backgroundColor,
                                            fontWeight: bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: backgroundColor),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${controller.dataDokter['image_dokter']}"),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(defaultMargin),
                                topRight: Radius.circular(defaultMargin),
                              )),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      ([
                        Container(
                          padding: const EdgeInsets.only(
                            right: defaultMargin,
                            left: defaultMargin,
                          ),
                          margin: EdgeInsets.only(top: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              programCard(
                                  title: "Screening",
                                  subtitle: "Pemeriksaan",
                                  color: Color(0xff4D96FF),
                                  icon: Icons.search),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.LIST_PASIEN,
                                      arguments: {"from_page": "resep"});
                                },
                                child: programCard(
                                    title: "E-Resep",
                                    subtitle: "Resep Elektronik",
                                    color: Color(0xffF9CC4A),
                                    icon: Icons.receipt_rounded),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.LIST_PASIEN,
                                      arguments: {"from_page": "rujukan"});
                                },
                                child: programCard(
                                    title: "E-Rujukan",
                                    subtitle: "Rujukan Elektronik",
                                    color: Color(0xffF56C6C),
                                    icon: Icons.today),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.LIST_PASIEN,
                                      arguments: {"from_page": "odontogram"});
                                },
                                child: programCard(
                                    title: "Odontogram",
                                    subtitle: "Rekam Medis",
                                    color: Color(0xffF98121),
                                    icon: Icons.medical_services),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: defaultMargin, right: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tambah Edukasimu",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 17, fontWeight: semiBold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DAFTAR_ARTIKEL);
                                },
                                child: Text(
                                  "See all",
                                  style: secondaryTextStyle.copyWith(
                                      fontSize: 17, fontWeight: medium),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: defaultMargin, right: defaultMargin),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children:
                                    controller.listOfArticles.map((value) {
                              return DaftarArtikelPopulerCard(
                                  articleTitle: value['articleTitle']!,
                                  articleImage: value['articleImage']!);
                            }).toList()),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: defaultMargin, right: defaultMargin),
                          child: Text(
                            "Latest News",
                            style: primaryTextStyle.copyWith(
                                fontSize: 17, fontWeight: semiBold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: defaultMargin, right: defaultMargin),
                          child: Column(
                            children: controller.listOfArticles.map((value) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${value['articleTitle']}",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "${value['articleImage']}",
                                      width: 100,
                                    ),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              )),
      ),
    );
  }

  Column programCard(
      {required String title,
      required String subtitle,
      required Color color,
      required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(defaultMargin),
          ),
          child: Icon(
            icon,
            color: backgroundColor,
            size: 35,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            "${title}",
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              color: Color(0xff4D96FF),
              fontWeight: bold,
            ),
          ),
        ),
        // Center(
        //   child: Text(
        //     "${subtitle}",
        //     style: primaryTextStyle.copyWith(
        //         fontSize: 10, color: Color(0xff4D96FF)),
        //   ),
        // ),
      ],
    );
  }
}
