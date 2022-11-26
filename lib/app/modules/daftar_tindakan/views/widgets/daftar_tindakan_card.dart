import 'package:flutter/material.dart';
import 'package:teledintistry/app/theme.dart';

class DaftarTindakanCard extends StatelessWidget {
  const DaftarTindakanCard({
    Key? key,
    required this.namaTindakan,
    required this.jenisProgram,
    required this.imageUrl,
  }) : super(key: key);

  final String namaTindakan;
  final String jenisProgram;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.5, color: Colors.black26, offset: Offset(0, 1))
          ]),
      child: Row(
        children: [
          (imageUrl == "")
              ? SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    "assets/logo_login.png",
                    fit: BoxFit.cover,
                  ),
                )
              : SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaTindakan,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(jenisProgram,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
