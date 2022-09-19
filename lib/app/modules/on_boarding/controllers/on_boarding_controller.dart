import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class OnBoardingController extends GetxController {
  var isLoading = false.obs;
  var counter = 1.obs;
  addImage() {
    var storage = FirebaseStorage.instance;

    List<String> odontogramImage = [
      "assets/default_odontogram/11.png",
      "assets/default_odontogram/12.png",
      "assets/default_odontogram/13.png",
      "assets/default_odontogram/14.png",
      "assets/default_odontogram/15.png",
      "assets/default_odontogram/16.png",
      "assets/default_odontogram/17.png",
      "assets/default_odontogram/18.png",
      "assets/default_odontogram/21.png",
      "assets/default_odontogram/22.png",
      "assets/default_odontogram/23.png",
      "assets/default_odontogram/24.png",
      "assets/default_odontogram/25.png",
      "assets/default_odontogram/26.png",
      "assets/default_odontogram/27.png",
      "assets/default_odontogram/28.png",
      "assets/default_odontogram/31.png",
      "assets/default_odontogram/32.png",
      "assets/default_odontogram/33.png",
      "assets/default_odontogram/34.png",
      "assets/default_odontogram/35.png",
      "assets/default_odontogram/36.png",
      "assets/default_odontogram/37.png",
      "assets/default_odontogram/38.png",
      "assets/default_odontogram/41.png",
      "assets/default_odontogram/42.png",
      "assets/default_odontogram/43.png",
      "assets/default_odontogram/44.png",
      "assets/default_odontogram/45.png",
      "assets/default_odontogram/46.png",
      "assets/default_odontogram/47.png",
      "assets/default_odontogram/48.png",
      "assets/default_odontogram/51.png",
      "assets/default_odontogram/52.png",
      "assets/default_odontogram/53.png",
      "assets/default_odontogram/54.png",
      "assets/default_odontogram/55.png",
      "assets/default_odontogram/61.png",
      "assets/default_odontogram/62.png",
      "assets/default_odontogram/63.png",
      "assets/default_odontogram/64.png",
      "assets/default_odontogram/65.png",
      "assets/default_odontogram/71.png",
      "assets/default_odontogram/72.png",
      "assets/default_odontogram/73.png",
      "assets/default_odontogram/74.png",
      "assets/default_odontogram/75.png",
      "assets/default_odontogram/81.png",
      "assets/default_odontogram/82.png",
      "assets/default_odontogram/83.png",
      "assets/default_odontogram/84.png",
      "assets/default_odontogram/85.png",
    ];

    odontogramImage.forEach((img) async {
      isLoading.value = true;

      var authUser = FirebaseAuth.instance;
      String imageName =
          img.substring(img.lastIndexOf("/") + 1, img.lastIndexOf("."));

      // String path = img.substring(img.indexOf("/") + 1, img.lastIndexOf("/"));

      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load(img);
      final file = File('${systemTempDir.path}/$imageName.png');

      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      TaskSnapshot taskSnapshot = await storage
          .ref('users/${authUser.currentUser!.uid}/odontogram/$imageName')
          .putFile(file);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(authUser.currentUser!.uid)
          .set({
        "odontogram": {
          imageName: "${downloadUrl}",
        },
      }, SetOptions(merge: true));
    });
    isLoading.value = false;
    successSnackBar(
      title: "Complete Registration",
      message: "Mulai pengalaman terbaik anda",
    );
    Get.offAllNamed(Routes.MAIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}
}
