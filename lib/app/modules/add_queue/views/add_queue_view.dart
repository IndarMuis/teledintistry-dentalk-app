import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_queue_controller.dart';

class AddQueueView extends GetView<AddQueueController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddQueueView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddQueueView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
