import 'package:flutter/material.dart';

import '../../../../theme.dart';

class DaftarArtikelTerbaruCard extends StatelessWidget {
  DaftarArtikelTerbaruCard({Key? key, this.namaArtikel, this.gambarArtikel})
      : super(key: key);

  final String? namaArtikel;
  final String? gambarArtikel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding:
                EdgeInsets.symmetric(horizontal: 10, vertical: defaultMargin),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${namaArtikel}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: medium,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "${gambarArtikel}",
                    width: 100,
                  ),
                )
              ],
            )),
        Divider(color: secondaryTextColor, height: 2),
      ],
    );
  }
}
