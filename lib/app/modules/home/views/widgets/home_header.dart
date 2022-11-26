import 'package:flutter/material.dart';

import '../../../../theme.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({required this.name, required this.avatar});
  final String name;
  final String avatar;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            // FOR API
            backgroundImage: AssetImage("${avatar}"),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // "Hai, Muh. Awal Arifin",
                  // FOR API
                  "${name}",
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Jangan lupa sikat gigi hari ini yah!",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
