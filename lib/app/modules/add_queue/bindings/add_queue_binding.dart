import 'package:get/get.dart';

import '../controllers/add_queue_controller.dart';

class AddQueueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddQueueController>(
      () => AddQueueController(),
    );
  }
}
