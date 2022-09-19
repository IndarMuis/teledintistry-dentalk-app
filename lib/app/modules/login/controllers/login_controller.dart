import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        var docUsers = await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .get();
        if (userCredential.user!.uid.isNotEmpty) {
          if (docUsers.exists &&
              docUsers.data()!['user_role'].toString().contains("user")) {
            print(docUsers.data());
            isLoading.value = false;
            if ((docUsers.data()!['odontogram'] as Map).isEmpty) {
              await successSnackBar(
                  title: "Login Successful",
                  message: "Berhasil melakukan login");
              Get.offAllNamed(Routes.ON_BOARDING);
            } else {
              await successSnackBar(
                  title: "Login Successful",
                  message: "Berhasil melakukan login");
              Get.offAllNamed(Routes.MAIN);
            }
          } else {
            Get.offAllNamed(Routes.MAIN_DOCTOR);
            isLoading.value = false;
          }
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'user-not-found') {
          await errorSnackBar(
              title: "Login Failed", message: "User tidak ditemukan");
        } else if (e.code == 'wrong-password') {
          await errorSnackBar(
              title: "Login Failed", message: "Email atau password salah");
        }
      }
    } else {
      isLoading.value = false;
      await errorSnackBar(
          title: "Login Failed", message: "Silahkan isi data terlebih dahulu");
    }
  }

  @override
  void onInit() {
    emailController = new TextEditingController(text: "drgjayadi@gmail.com");
    passwordController = new TextEditingController(text: "dokter1234");
    super.onInit();
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();

    super.onClose();
  }
}
