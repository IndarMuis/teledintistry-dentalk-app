import 'package:flutter/material.dart';

import '../../../../theme.dart';

class HomeProgramCard extends StatelessWidget {
  HomeProgramCard({required this.programName, required this.programImage});
  String programName;
  String programImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      height: 130,
      width: 130,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: primaryTextColor)],
          borderRadius: BorderRadius.circular(defaultMargin),
          image: DecorationImage(
              image: NetworkImage("${programImage}"), fit: BoxFit.cover)),
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
                fontSize: 17, fontWeight: medium, color: backgroundColor),
          ),
        ),
      ),
    );
  }
}
