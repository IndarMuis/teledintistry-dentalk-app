import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class EResepDokterController extends GetxController {
  var dataPasien = {}.obs;
  var dataDokter = {}.obs;

  var idPasien = "".obs;
  var isLoading = false.obs;

  var documentName = "".obs;
  var documentPath = "".obs;

  pilihResep() async {
    try {
      final path = await FlutterDocumentPicker.openDocument();
      documentPath.value = path!;
      documentName.value = basename(path);
    } catch (e) {}
  }

  kirimResep() async {
    isLoading.value = true;
    try {
      var storage = FirebaseStorage.instance;
      if (documentPath.value.isNotEmpty) {
        File file = File(documentPath.value);
        if (file.path.contains(".pdf")) {
          TaskSnapshot taskSnapshot = await storage
              .ref('users/${dataPasien['uid']}/resep/${documentName.value}')
              .putFile(file);
          final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

          await FirebaseFirestore.instance
              .collection("pasien")
              .doc(dataPasien['uid'])
              .set({
            "notifikasi": {
              "resep": {
                "id_dokter": dataDokter['id_dokter'],
                "nama_file": documentName.value,
                "nama_dokter": dataDokter['nama_dokter'],
                "file_resep": downloadUrl,
              }
            },
          }, SetOptions(merge: true));
          isLoading.value = false;
          await successSnackBar(
              title: "Berhasil mengirim resep",
              message:
                  "Berhasil mengirim resep pada pasien ${dataPasien['username']}");
          Get.offAllNamed(Routes.MAIN_DOCTOR);
        } else {
          isLoading.value = false;
          await errorSnackBar(
              title: "Gagal Mengirim Resep",
              message: "File harus berupa document pdf");
          Get.back();
        }
      } else {
        isLoading.value = false;
        await errorSnackBar(
            title: "Gagal Mengirim Resep",
            message: "Silahkan masukkan file resep terlebih dahulu");
        Get.back();
      }
    } on FirebaseException catch (e) {
      print(e.message);
      isLoading.value = false;
      await errorSnackBar(
          title: "Gagal Mengirim Resep",
          message: "Terjadi kesalahan dalam penginputan file");
    }
    isLoading.value = false;
  }

  @override
  void onInit() async {
    isLoading.value = true;
    idPasien.value = await Get.arguments['id_user'];

    var idDokter = await FirebaseAuth.instance.currentUser!.uid;

    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(idPasien.value)
        .get();

    var dokter = await FirebaseFirestore.instance
        .collection("dokter")
        .doc(idDokter)
        .get();

    dataPasien.value = await data.data()!;
    dataDokter.value = await dokter.data()!;

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
