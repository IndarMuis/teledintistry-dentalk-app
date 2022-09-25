import 'package:get/get.dart';

import '../controllers/all_fitur_dokter_controller.dart';

class AllFiturDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllFiturDokterController>(
      () => AllFiturDokterController(),
    );
  }
}
