import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var dataUser = {}.obs;
  var dataDokter = {}.obs;
  var isLoading = false.obs;
  File? image;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> existingUser(String uid) async {
    CollectionReference users = await _firestore.collection("users");

    var existUser = await users.doc(uid).get();

    if (existUser.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  deleteImage() async {
    isLoading.value = true;
    var isUser = await existingUser(_auth.currentUser!.uid);

    if (isUser) {
      await _firestore.collection("users").doc(_auth.currentUser!.uid).update({
        "image_user": "",
      });
      await successSnackBar(
          title: "Successfull Delete Image",
          message: "Behasil menghapus gambar");
    } else {
      await _firestore.collection("dokter").doc(_auth.currentUser!.uid).update({
        "image_dokter": "",
      });
      await successSnackBar(
          title: "Successfull Delete Image",
          message: "Behasil menghapus gambar");
    }
    isLoading.value = false;
    Get.offAllNamed(Routes.MAIN);
  }

  Future<void> logOut() async {
    isLoading.value = true;
    await FirebaseAuth.instance.signOut();

    Get.offAllNamed(Routes.LOGIN);
    isLoading.value = false;
  }

  uploadImage() async {
    isLoading.value = true;
    try {
      final dataImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      var file = File(dataImage!.path);

      if (dataImage != null) {
        TaskSnapshot taskSnapshot = await _storage
            .ref('users/${_auth.currentUser!.uid}/profile/${file.path}}')
            .putFile(file);
        final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        var cekPasienAccount = await existingUser(_auth.currentUser!.uid);
        if (cekPasienAccount) {
          await _firestore
              .collection("users")
              .doc(_auth.currentUser!.uid)
              .update({
            "image_user": downloadUrl,
          });
          await successSnackBar(
              title: "Successfull Upload Image",
              message: "Behasil menambahkan gambar");
        } else {
          await _firestore
              .collection("dokter")
              .doc(_auth.currentUser!.uid)
              .update({
            "image_dokter": downloadUrl,
          });
          await successSnackBar(
              title: "Successfull Upload Image",
              message: "Behasil menambahkan gambar");
        }
      }
      isLoading.value = false;
      Get.offAllNamed(Routes.MAIN);
    } catch (e) {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
    FirebaseFirestore firestore = await FirebaseFirestore.instance;

    var data = await firestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    if (data.data() != null) {
      dataUser.value = data.data()!;
    } else {
      var dokter = await firestore
          .collection("dokter")
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      dataDokter.value = dokter.data()!;
    }

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
