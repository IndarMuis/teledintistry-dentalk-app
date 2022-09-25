import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArtikelViewController extends GetxController {
  var isLoading = true.obs;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> back(String uid) async {
    CollectionReference users = await _firestore.collection("users");

    var existUser = await users.doc(uid).get();

    if (existUser.data() != null) {
      Get.offAllNamed(Routes.MAIN);
    } else {
      Get.offAllNamed(Routes.MAIN_DOCTOR);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
