import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailProfileDokterController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var idDokter = "".obs;
  var dataDokter = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    idDokter.value = await Get.arguments;
    CollectionReference collectDokter = _firestore.collection("dokter");

    var data = await collectDokter.doc(idDokter.value).get();

    dataDokter.value = data.data() as Map<String, dynamic>;

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
