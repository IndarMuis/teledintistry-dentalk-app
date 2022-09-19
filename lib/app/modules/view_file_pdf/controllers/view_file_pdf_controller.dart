import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:get/get.dart';

class ViewFilePdfController extends GetxController {
  var appBarTittle = "".obs;
  var isLoading = false.obs;

  PDFDocument? document;

  @override
  void onInit() async {
    isLoading.value = true;

    var dataFile = await Get.arguments;

    try {} catch (e) {}
    document = await PDFDocument.fromURL('${dataFile['file']['file_resep']}');

    appBarTittle.value = dataFile['title'];

    print(dataFile);

    isLoading.value = false;
    super.onInit();
  }
}
