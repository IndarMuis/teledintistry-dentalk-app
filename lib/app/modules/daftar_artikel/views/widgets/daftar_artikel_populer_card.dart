import 'package:flutter/material.dart';

import '../../../../theme.dart';

class DaftarArtikelPopulerCard extends StatelessWidget {
  DaftarArtikelPopulerCard(
      {required this.articleTitle, required this.articleImage});
  final String articleTitle;
  final String articleImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "${articleImage}",
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${articleTitle}",
            style: primaryTextStyle.copyWith(
              fontSize: 15,
              fontWeight: medium,
            ),
            maxLines: 2,
            overflow: TextOverflow.clip,
          )
        ],
      ),
    );
  }
}
