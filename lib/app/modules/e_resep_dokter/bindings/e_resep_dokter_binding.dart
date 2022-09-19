import 'package:get/get.dart';

import '../controllers/e_resep_dokter_controller.dart';

class EResepDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EResepDokterController>(
      () => EResepDokterController(),
    );
  }
}
