import 'package:get/get.dart';

import '../controllers/agenda_dokter_controller.dart';

class AgendaDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgendaDokterController>(
      () => AgendaDokterController(),
    );
  }
}
