import 'package:flutter/material.dart';
import 'package:teledintistry/app/theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.nama, required this.iconData})
      : super(key: key);

  final String nama;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: primaryColor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(defaultMargin),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultMargin),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$nama",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: semiBold,
              ),
            ),
            Icon(
              iconData,
              size: 20,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
