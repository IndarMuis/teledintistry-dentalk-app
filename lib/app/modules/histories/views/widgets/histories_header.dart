import 'package:flutter/material.dart';
import 'package:teledintistry/app/theme.dart';

class HistoriesHeader extends StatelessWidget {
  const HistoriesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        "History",
        style: primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
      ),
    );
  }
}
