import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InfoProgramController extends GetxController {
  var dataProgram = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    var collection = FirebaseFirestore.instance.collection('program');

    var docProgram = await collection.doc('${Get.arguments}').get();
    if (docProgram.exists) {
      dataProgram.value = docProgram.data()!;
      dataProgram..addAll({"id_program": docProgram.id});
    }
    isLoading.value = false;
    super.onInit();
  }
}
