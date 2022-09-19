import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/daftar_artikel/views/widgets/daftar_artikel_header.dart';
import 'package:teledintistry/app/modules/daftar_artikel/views/widgets/daftar_artikel_terbaru_card.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/daftar_artikel_controller.dart';
import 'widgets/daftar_artikel_populer_card.dart';

class DaftarArtikelView extends GetView<DaftarArtikelController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              DaftarArtikelHeader(),
              SizedBox(
                height: 40,
              ),
              Material(
                shadowColor: primaryColor.withOpacity(0.5),
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: backgroundColor,
                    hintText: "Search",
                    suffixIcon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                    suffixIconColor: secondaryTextColor,
                    hintStyle: secondaryTextStyle,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                            color: Colors.white, style: BorderStyle.none)),
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Populer",
                style: primaryTextStyle.copyWith(
                    fontSize: 17, fontWeight: semiBold),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: controller.listOfArticles.map((value) {
                  return DaftarArtikelPopulerCard(
                      articleTitle: value['articleTitle']!,
                      articleImage: value['articleImage']!);
                }).toList()),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Latest New",
                style: primaryTextStyle.copyWith(
                    fontSize: 17, fontWeight: semiBold),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: controller.listOfArticles.map((value) {
                  return DaftarArtikelTerbaruCard(
                    namaArtikel: value['articleTitle'],
                    gambarArtikel: value['articleImage'],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
