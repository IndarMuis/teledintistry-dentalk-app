import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailPasienController extends GetxController {
  var isLoading = false.obs;
  var dataPasien = {}.obs;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() async {
    isLoading.value = true;

    var data = await _firestore.collection("pasien").doc(Get.arguments).get();

    dataPasien.value = data.data()!;
    super.onInit();
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
