import 'package:flutter/material.dart';
import 'package:teledintistry/app/theme.dart';

class AllFiturDokterHeader extends StatelessWidget {
  const AllFiturDokterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        "Tindakan Dokter",
        style: primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
      ),
    );
  }
}
