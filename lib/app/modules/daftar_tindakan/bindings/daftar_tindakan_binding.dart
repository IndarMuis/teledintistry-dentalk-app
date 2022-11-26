import 'package:get/get.dart';

import '../controllers/daftar_tindakan_controller.dart';

class DaftarTindakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarTindakanController>(
      () => DaftarTindakanController(),
    );
  }
}
