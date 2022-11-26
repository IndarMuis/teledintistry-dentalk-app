import 'package:flutter/material.dart';
import 'package:teledintistry/app/theme.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({
    Key? key,
    required this.namaProgram,
    required this.jumlahTindakan,
  }) : super(key: key);

  final String namaProgram;
  final int jumlahTindakan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(
        14,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [BoxShadow(color: primaryTextColor)],
        borderRadius: BorderRadius.circular(defaultMargin),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo_onBoarding.png",
            width: 60,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  namaProgram,
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    color: backgroundColor,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  "Tersedia ${jumlahTindakan} tindakan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    color: backgroundColor,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 5,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultMargin)),
          )
        ],
      ),
    );
  }
}
