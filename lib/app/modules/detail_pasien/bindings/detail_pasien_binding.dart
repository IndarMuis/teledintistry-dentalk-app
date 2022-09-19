import 'package:get/get.dart';

import '../controllers/detail_pasien_controller.dart';

class DetailPasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPasienController>(
      () => DetailPasienController(),
    );
  }
}
