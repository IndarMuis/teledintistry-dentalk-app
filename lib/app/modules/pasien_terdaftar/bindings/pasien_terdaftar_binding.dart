import 'package:get/get.dart';

import '../controllers/pasien_terdaftar_controller.dart';

class PasienTerdaftarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasienTerdaftarController>(
      () => PasienTerdaftarController(),
    );
  }
}
