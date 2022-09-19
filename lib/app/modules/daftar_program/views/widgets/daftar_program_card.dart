import 'package:flutter/material.dart';

import '../../../../theme.dart';

class DaftarProgramCard extends StatelessWidget {
  DaftarProgramCard({required this.programName, required this.programImage});
  String programName;
  String programImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: primaryTextColor)],
          borderRadius: BorderRadius.circular(defaultMargin),
          image: DecorationImage(
              image: AssetImage("${programImage}"), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultMargin),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                primaryColor.withOpacity(0.3),
              ]),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "${programName}",
            style: primaryTextStyle.copyWith(
                fontSize: 25, fontWeight: medium, color: backgroundColor),
          ),
        ),
      ),
    );
  }
}
