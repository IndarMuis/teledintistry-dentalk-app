import 'package:flutter/material.dart';

import '../../../../theme.dart';

// class HomeProgramCard extends StatelessWidget {
//   HomeProgramCard({required this.programName, required this.programImage});
//   final String programName;
//   final String programImage;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 13),
//       height: 130,
//       width: 130,
//       decoration: BoxDecoration(
//           boxShadow: [BoxShadow(color: primaryTextColor)],
//           borderRadius: BorderRadius.circular(defaultMargin),
//           image: DecorationImage(
//             image: NetworkImage("${programImage}"),
//             fit: BoxFit.cover,
//           )),
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(defaultMargin),
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.transparent,
//                 primaryColor.withOpacity(0.3),
//               ]),
//         ),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Text(
//             "${programName}",
//             style: primaryTextStyle.copyWith(
//                 fontSize: 17, fontWeight: medium, color: backgroundColor),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomeProgramCard extends StatelessWidget {
  const HomeProgramCard({
    Key? key,
    required this.namaProgram,
    required this.jumlahTindakan,
  }) : super(key: key);

  final String namaProgram;
  final int jumlahTindakan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [BoxShadow(color: primaryTextColor)],
        borderRadius: BorderRadius.circular(defaultMargin),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaProgram,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    color: backgroundColor,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Tersedia ${jumlahTindakan} tindakan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    color: backgroundColor,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(
                "assets/logo_onBoarding.png",
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 80,
            width: 3,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultMargin)),
          )
        ],
      ),
    );
  }
}
