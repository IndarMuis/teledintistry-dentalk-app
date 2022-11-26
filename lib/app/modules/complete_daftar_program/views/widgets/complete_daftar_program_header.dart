import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:teledintistry/app/theme.dart';

class CompleteDaftarProgramHeader extends StatelessWidget {
  const CompleteDaftarProgramHeader({Key? key}) : super(key: key);

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
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: secondaryTextColor,
                  size: 30,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Daftar Program",
                style:
                    primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5))
        ],
      ),
    );
  }
}
