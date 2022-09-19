import 'package:get/get.dart';

import '../controllers/complete_daftar_program_controller.dart';

class CompleteDaftarProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteDaftarProgramController>(
      () => CompleteDaftarProgramController(),
    );
  }
}
