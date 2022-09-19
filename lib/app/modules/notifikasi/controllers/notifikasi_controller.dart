import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class NotifikasiController extends GetxController {
  var dataNotifikasi = {}.obs;
  var isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);

    if (file == null) {
      return;
    }
    print('Path : ${file.path}');

    OpenFile.open(file.path);

    Get.back();
  }

  Future<File?> downloadFile(String urlDownload, String fileName) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$fileName');

    try {
      final response = await Dio().get(urlDownload,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } on DioError catch (e) {
      print(e.response);
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    var firebase = await FirebaseFirestore.instance
        .collection("pasien")
        .doc(auth.currentUser!.uid)
        .get();

    var data = firebase.data();

    dataNotifikasi.value = await data!;
    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
