import 'package:get/get.dart';

import '../controllers/artikel_view_controller.dart';

class ArtikelViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtikelViewController>(
      () => ArtikelViewController(),
    );
  }
}
