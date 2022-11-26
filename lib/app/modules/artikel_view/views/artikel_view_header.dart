import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/modules/artikel_view/controllers/artikel_view_controller.dart';
import 'package:teledintistry/app/theme.dart';

class ArtikelViewHeader extends StatelessWidget {
  ArtikelViewHeader({Key? key}) : super(key: key);
  final controller = Get.put(ArtikelViewController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: secondaryTextColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(13)),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  controller.back(controller.auth.currentUser!.uid);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: secondaryTextColor,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
          ),
          Text(
            "Artikel",
            style: primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
          )
        ],
      ),
    );
  }
}
