import 'package:get/get.dart';

import '../controllers/detail_profile_dokter_controller.dart';

class DetailProfileDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProfileDokterController>(
      () => DetailProfileDokterController(),
    );
  }
}
