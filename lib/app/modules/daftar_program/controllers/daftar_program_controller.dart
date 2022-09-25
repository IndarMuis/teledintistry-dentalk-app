import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaftarProgramController extends GetxController {
  List<Map<String, String>> programList = [
    {
      "programName": "Scalling",
      "programImage": "assets/image_scalling.png",
    },
    {
      "programName": "Tambal Gigi",
      "programImage": "assets/image_tambalGigi.png"
    },
    {
      "programName": "Bleaching",
      "programImage": "assets/image_tambalGigi.png",
    },
  ];

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList allProgram = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    var data = await _firestore.collection("program").get();

    var dataProgram = await data;

    dataProgram.docs.forEach((element) {
      allProgram.add(element.data());
    });

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {
    print("ditutup");
  }
}
