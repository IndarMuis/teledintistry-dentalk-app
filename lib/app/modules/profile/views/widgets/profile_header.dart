import 'package:flutter/material.dart';
import 'package:teledintistry/app/theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile",
        style: primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
      ),
    );
  }
}
