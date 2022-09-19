import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/preview_odontogram_controller.dart';

class PreviewOdontogramView extends GetView<PreviewOdontogramController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PreviewOdontogramView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PreviewOdontogramView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
