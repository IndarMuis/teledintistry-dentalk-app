import 'package:get/get.dart';

import '../controllers/info_program_controller.dart';

class InfoProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoProgramController>(
      () => InfoProgramController(),
    );
  }
}
