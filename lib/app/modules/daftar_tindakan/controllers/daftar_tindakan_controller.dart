import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaftarTindakanController extends GetxController {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  final count = 0.obs;
  var jenisProgram = "".obs;
  var daftarTindakan = [].obs;
  var isLoading = false.obs;
  @override
  void onInit() async {
    var data = Get.arguments;
    jenisProgram.value = data['jenis_program'];

    isLoading.value = true;
    try {
      var data = await _firebase
          .collection("program")
          .where("jenis_program", isEqualTo: jenisProgram.value)
          .get();
      data.docs.map((e) => {daftarTindakan.add(e.data())}).toList();
    } on FirebaseException {
      isLoading.value = false;
      rethrow;
    }

    print(this.daftarTindakan);
    print("JENIS PROGRAM : " + jenisProgram.value);
    isLoading.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
