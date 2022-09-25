import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/artikel_view/views/artikel_view_header.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/artikel_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArtikelViewView extends GetView<ArtikelViewController> {
  final controller = Get.put(ArtikelViewController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 10,
                  top: defaultMargin),
              child: ArtikelViewHeader(),
            ),
            Expanded(
                child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: Get.arguments,
              backgroundColor: backgroundColor,
              onProgress: (value) {
                if (value != 100) {
                  CircularProgressIndicator(
                    color: primaryColor,
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
