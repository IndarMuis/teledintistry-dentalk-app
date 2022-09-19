import 'package:get/get.dart';

import '../controllers/view_file_pdf_controller.dart';

class ViewFilePdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewFilePdfController>(
      () => ViewFilePdfController(),
    );
  }
}
