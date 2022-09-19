import 'package:get/get.dart';

import '../controllers/odontogram_controller.dart';

class OdontogramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OdontogramController>(
      () => OdontogramController(),
    );
  }
}
