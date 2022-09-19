import 'package:get/get.dart';

import '../controllers/list_pasien_controller.dart';

class ListPasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPasienController>(
      () => ListPasienController(),
    );
  }
}
