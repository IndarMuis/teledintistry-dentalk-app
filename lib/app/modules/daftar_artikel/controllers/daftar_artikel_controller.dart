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

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
