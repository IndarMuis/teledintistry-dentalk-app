import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/modules/home/controllers/home_controller.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

import '../../../../theme.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({required this.name, required this.avatar});
  String name;
  String avatar;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            // FOR API
            backgroundImage: AssetImage("${avatar}"),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // "Hai, Muh. Awal Arifin",
                  // FOR API
                  "${name}",
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Jangan lupa sikat gigi hari ini yah!",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.NOTIFIKASI);
              },
              icon: Icon(
                Icons.notifications,
                size: 35,
                color: primaryColor,
              )),
        ],
      ),
    );
  }
}
