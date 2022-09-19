import 'package:flutter/material.dart';

import '../../../../theme.dart';

class DaftarArtikelTerbaruCard extends StatelessWidget {
  DaftarArtikelTerbaruCard({Key? key, this.namaArtikel, this.gambarArtikel})
      : super(key: key);

  String? namaArtikel;
  String? gambarArtikel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
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
              child: Image.asset(
                "${gambarArtikel}",
                width: 100,
              ),
            )
          ],
        ));
  }
}
