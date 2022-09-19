import 'package:get/get.dart';

import '../controllers/daftar_program_controller.dart';

class DaftarProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarProgramController>(
      () => DaftarProgramController(),
    );
  }
}
