import 'package:get/get.dart';

import '../controllers/main_doctor_controller.dart';

class MainDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainDoctorController>(
      () => MainDoctorController(),
    );
  }
}
