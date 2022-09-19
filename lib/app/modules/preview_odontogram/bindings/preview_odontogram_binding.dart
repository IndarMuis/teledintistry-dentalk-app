import 'package:get/get.dart';

import '../controllers/preview_odontogram_controller.dart';

class PreviewOdontogramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewOdontogramController>(
      () => PreviewOdontogramController(),
    );
  }
}
