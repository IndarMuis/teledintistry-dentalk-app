import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController umurController;
  late TextEditingController alamatController;
  late TextEditingController teleponController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    if (usernameController.text.isNotEmpty &&
        umurController.text.isNotEmpty &&
        alamatController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        await users.doc(userCredential.user!.uid).set({
          "uid": userCredential.user!.uid,
          "username": usernameController.text,
          "umur": umurController.text,
          "alamat": alamatController.text,
          "telepon": teleponController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "user_role": "user",
          "image": "",
          "odontogram": {},
        });
        await users.doc(userCredential.user!.uid).collection("chats");

        await successSnackBar(
            title: "Successful Registration",
            message: "Berhasil melakukan registrasi");
        isLoading.value = false;
        Get.offAllNamed(Routes.ON_BOARDING);
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          await errorSnackBar(
              title: "Registration Failed",
              message: "Password harus terdiri dari 8 karakter atau lebih.");
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          await errorSnackBar(
            title: "Registration Failed",
            message: "Email sudah terdaftar, silahkan gunakan email lain.",
          );
        } else if (e.code == 'invalid-email') {
          await errorSnackBar(
            title: "Registration Failed",
            message: "Format email yang dimasukkan tidak sesuai.",
          );
        }
      } catch (e) {
        isLoading.value = false;
        await errorSnackBar(
          title: "Registration Failed",
          message: "${e.toString()}",
        );
      }
    } else {
      isLoading.value = false;
      await errorSnackBar(
        title: "Registration Failed",
        message: "Silahkan lengkapi data terlebih dahulu.",
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    usernameController = new TextEditingController();
    umurController = new TextEditingController();
    alamatController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    teleponController = new TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    umurController.dispose();
    alamatController.dispose();
    emailController.dispose();
    passwordController.dispose();
    teleponController.dispose();
  }
}
