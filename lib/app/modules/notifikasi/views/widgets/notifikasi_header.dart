import 'package:flutter/material.dart';
import 'package:teledintistry/app/theme.dart';

class NotifikasiHeader extends StatelessWidget {
  const NotifikasiHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Notifikasi",
        style: primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
      ),
    );
  }
}
