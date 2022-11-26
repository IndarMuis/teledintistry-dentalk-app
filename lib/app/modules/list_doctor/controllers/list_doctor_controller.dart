import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ListDoctorController extends GetxController {
  var isLoading = false.obs;

  var dataDokter = [].obs;

  @override
  void onInit() async {
    isLoading.value = true;
    var dokter = FirebaseFirestore.instance.collection('dokter');
    var docDokter = await dokter;

    await docDokter.get().then((value) {
      value.docs.forEach((element) {
        dataDokter.add(element.data());
      });
    });

    isLoading.value = false;

    super.onInit();
  }
}
