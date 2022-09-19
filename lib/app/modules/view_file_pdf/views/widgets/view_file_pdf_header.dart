import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:teledintistry/app/theme.dart';

class ViewFilePdfHeader extends StatelessWidget {
  const ViewFilePdfHeader({Key? key, this.fileName}) : super(key: key);

  final String? fileName;
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
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.8,
          ),
          Text(
            "${fileName}",
            style: primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
          ),
        ],
      ),
    );
  }
}
