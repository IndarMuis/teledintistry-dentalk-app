import 'package:get/get.dart';

import '../controllers/daftar_artikel_controller.dart';

class DaftarArtikelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarArtikelController>(
      () => DaftarArtikelController(),
    );
  }
}
