import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/view_file_pdf/views/widgets/view_file_pdf_header.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/view_file_pdf_controller.dart';

class ViewFilePdfView extends GetView<ViewFilePdfController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => (controller.isLoading.isTrue)
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: ListView(
                  children: [
                    ViewFilePdfHeader(
                      fileName: controller.appBarTittle.value,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    PDFViewer(document: controller.document!),
                  ],
                ),
              )),
      ),
    );
  }
}
