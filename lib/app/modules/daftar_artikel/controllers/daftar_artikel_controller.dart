import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaftarArtikelController extends GetxController {
  List<Map<String, String>> listOfArticles = [
    {
      "articleTitle": "Kriteria Gigi Sehat pada Anak dan Cara Merawatnya",
      "articleImage": "assets/image_scalling.png"
    },
    {
      "articleTitle": "5 Cara Merawat Gigi dan Mulut Pada Lansia",
      "articleImage": "assets/image_scalling.png"
    },
    {
      "articleTitle": "5 Cara Merawat Gigi dan Mulut Pada Lansia",
      "articleImage": "assets/image_scalling.png"
    },
    {
      "articleTitle": "5 Cara Merawat Gigi dan Mulut Pada Lansia",
      "articleImage": "assets/image_scalling.png"
    },
    {
      "articleTitle": "5 Cara Merawat Gigi dan Mulut Pada Lansia",
      "articleImage": "assets/image_scalling.png"
    },
  ];

  var dataArtikel = [].obs;
  var isLoading = false.obs;
  @override
  void onInit() async {
    isLoading.value = true;
    var artikel = await FirebaseFirestore.instance.collection('artikel');
    var docArtikel = await artikel;

    await docArtikel.get().then((value) => {
          value.docs.forEach((element) {
            dataArtikel.add(element.data());
          })
        });

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
