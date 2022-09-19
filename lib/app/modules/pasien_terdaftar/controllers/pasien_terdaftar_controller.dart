import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PasienTerdaftarController extends GetxController {
  var isLoading = false.obs;
  var daftarPasien = [].obs;

  @override
  void onInit() async {
    isLoading.value = true;

    FirebaseAuth userAuth = FirebaseAuth.instance;
    var pasien = FirebaseFirestore.instance.collection('pasien');

    var dataPasien = await pasien;

    await dataPasien.get().then((value) {
      value.docs.forEach((element) {
        if (element['dokter']['id_dokter'] == userAuth.currentUser!.uid) {
          daftarPasien.add(element.data());
        }
      });
    });

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
