import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeDoctorController extends GetxController {
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

  var idDokter = "".obs;
  var dataDokter = {}.obs;
  var dataArtikel = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var dokterCollection = FirebaseFirestore.instance.collection("dokter");
    var artikel = FirebaseFirestore.instance.collection("artikel");

    idDokter.value = firebaseAuth.currentUser!.uid;

    var docArtikel = await artikel;

    var data = await dokterCollection.doc(idDokter.value).get();

    dataDokter.value = data.data()!;

    await docArtikel.get().then((value) => {
          value.docs.forEach((element) {
            dataArtikel.add(element.data());
          })
        });

    print(dataArtikel.length);
    isLoading.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
