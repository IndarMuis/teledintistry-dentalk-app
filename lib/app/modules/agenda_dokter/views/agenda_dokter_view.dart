import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agenda_dokter_controller.dart';

class AgendaDokterView extends GetView<AgendaDokterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgendaDokterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AgendaDokterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
