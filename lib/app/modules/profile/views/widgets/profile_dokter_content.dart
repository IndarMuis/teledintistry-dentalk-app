import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/modules/profile/controllers/profile_controller.dart';
import 'package:teledintistry/app/modules/profile/views/widgets/profile_card.dart';
import 'package:teledintistry/app/modules/profile/views/widgets/profile_header.dart';
import 'package:teledintistry/app/theme.dart';

class ProfileDokterContent extends StatelessWidget {
  const ProfileDokterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return ListView(
        children: [
          ProfileHeader(),
          SizedBox(
            height: 70,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                      border: Border.all(color: secondaryTextColor),
                      image: (controller.dataDokter['image_dokter'] != null)
                          ? DecorationImage(
                              image: NetworkImage(
                                  "${controller.dataDokter['image_dokter']}"),
                              fit: BoxFit.fitHeight)
                          : DecorationImage(
                              image: AssetImage(
                                "assets/no_image.png",
                              ),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 150, bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                      border: Border.all(color: Colors.white)),
                  child: Icon(
                    Icons.add_a_photo,
                    size: 20,
                    color: backgroundColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ProfileCard(
              nama: "${controller.dataDokter['nama_dokter']}",
              iconData: Icons.person),
          SizedBox(
            height: 20,
          ),
          ProfileCard(
              nama: "${controller.dataDokter['email_dokter']}",
              iconData: Icons.email),
          SizedBox(
            height: 20,
          ),
          ProfileCard(
              nama: "${controller.dataDokter['umur_dokter']} Tahun",
              iconData: Icons.calendar_month),
          SizedBox(
            height: 20,
          ),
          ProfileCard(
              nama: "${controller.dataDokter['jabatan_dokter']}",
              iconData: Icons.grade_outlined),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(13),
                primary: Colors.red[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultMargin)),
              ),
              onPressed: () {
                Get.defaultDialog(
                    title: "LOG OUT",
                    titleStyle: primaryTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                    titlePadding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    contentPadding: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 20),
                    content: Obx(() => (controller.isLoading.value)
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.red[900],
                            ),
                          )
                        : Column(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.red[900]!.withOpacity(0.7),
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
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Colors.white,
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
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Colors.red[900],
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    onPressed: () {
                                      controller.logOut();
                                    },
                                    child: Text(
                                      "Lanjut",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                        color: backgroundColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )));
              },
              child: Center(
                child: Text(
                  "Log Out",
                  style: primaryTextStyle.copyWith(
                    fontSize: 17,
                    color: backgroundColor,
                    fontWeight: bold,
                  ),
                ),
              ))
        ],
      );
    });
  }
}
