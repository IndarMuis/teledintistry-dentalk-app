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
    {
      "programName": "Fetching",
      "programImage": "assets/image_scalling.png",
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    print("ditutup");
  }
}
