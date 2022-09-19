import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class OdontogramController extends GetxController {
  List<Map> pilihan = [
    {
      "id": 1,
      "name": "Anomali Pegshaped,Micro,etc",
      "image": "assets/odontogram/anomali_pegshaped_micro_etc.png",
    },
    {
      "id": 2,
      "name": "Caries",
      "image": "assets/odontogram/caries.png",
    },
    {
      "id": 3,
      "name": "Fit Fissure Sealant",
      "image": "assets/odontogram/fit_fissure_sealant.png",
    },
    {
      "id": 4,
      "name": "Fracture",
      "image": "assets/odontogram/fracture.png",
    },
    {
      "id": 5,
      "name": "Full Metal Crown Gigi Non Vital",
      "image": "assets/odontogram/full_metal_crown_gigi_non_vital.png",
    },
    {
      "id": 6,
      "name": "Full Metal Crown Gigi Vital",
      "image": "assets/odontogram/full_metal_crown_gigi_vital.png",
    },
    {
      "id": 7,
      "name": "Gigi Hilang",
      "image": "assets/odontogram/gigi_hilang.png",
    },
    {
      "id": 8,
      "name": "Gigi Non Vital",
      "image": "assets/odontogram/gigi_non_vital.png",
    },
    {
      "id": 9,
      "name": "Gigi Tidak Diketahui",
      "image": "assets/odontogram/gigi_tidak_diketahui.png",
    },
    {
      "id": 10,
      "name": "Implan Procelain Crown",
      "image": "assets/odontogram/implan_porcelain_crown.png",
    },
    {
      "id": 11,
      "name": "Normal",
      "image": "assets/odontogram/normal.png",
    },
    {
      "id": 12,
      "name": "Partial Denture",
      "image": "assets/odontogram/partial_denture.png",
    },
    {
      "id": 13,
      "name": "Partial Erupt",
      "image": "assets/odontogram/partial_erupt.png",
    },
    {
      "id": 14,
      "name": "Perawatan Saluran Akar",
      "image": "assets/odontogram/perawatan_saluran_akar.png",
    },
    {
      "id": 15,
      "name": "Porcelain Gigi Non Vital",
      "image": "assets/odontogram/porcelain_gigi_non_vital.png",
    },
    {
      "id": 16,
      "name": "Porcelain Gigi Vital",
      "image": "assets/odontogram/porcelain_gigi_vital.png",
    },
    {
      "id": 17,
      "name": "Sisa Akar",
      "image": "assets/odontogram/sisa_akar.png",
    },
    {
      "id": 18,
      "name": "Tambalan Amalgan Gigi Non Vital",
      "image": "assets/odontogram/tambalan_amalgan_gigi_non_vital.png",
    },
    {
      "id": 19,
      "name": "Tambalan Amalgan",
      "image": "assets/odontogram/tambalan_amalgan.png",
    },
    {
      "id": 20,
      "name": "Un_Erupted",
      "image": "assets/odontogram/un_erupted.png",
    },
  ];

  List<int> daftarNomor = [
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    51,
    52,
    53,
    54,
    55,
    61,
    62,
    63,
    64,
    65,
    71,
    72,
    73,
    74,
    75,
    81,
    82,
    83,
    84,
    85,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
  ];

  var idUser = "".obs;

  var odontogramValue = {}.obs;

  TextEditingController nomorOdontogram = new TextEditingController();
  var daftarPerubahanOdontogram = [].obs;

  var dataPasien = {}.obs;
  var odontogramPasien = {}.obs;

  var isLoading = false.obs;

  saveOdontogram() {
    var storage = FirebaseStorage.instance;

    List<dynamic> odontogramImage = daftarPerubahanOdontogram;

    odontogramImage.forEach((img) async {
      isLoading.value = true;

      var authUser = FirebaseAuth.instance;
      // String imageName =
      //     img.substring(img.lastIndexOf("/") + 1, img.lastIndexOf("."));

      // String path = img.substring(img.indexOf("/") + 1, img.lastIndexOf("/"));

      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load(img['image']);
      final file = File("${systemTempDir.path}/${img['id']}.png");

      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      TaskSnapshot taskSnapshot = await storage
          .ref('users/${idUser.value}/odontogram/${img['id']}')
          .putFile(file);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("users")
          .doc(idUser.value)
          .set(
        {
          "odontogram": {
            img['id']: "${downloadUrl}",
          },
        },
        SetOptions(merge: true),
      );
    });
    isLoading.value = false;
    successSnackBar(
      title: "Save Successful",
      message: "Berhasil menyimpan rekam medis odontogram",
    );
    Get.offAllNamed(Routes.MAIN_DOCTOR);
  }

  addNewOdontogram() {
    try {
      if (nomorOdontogram.text.isNotEmpty &&
          odontogramValue.isNotEmpty &&
          daftarNomor.contains(int.parse(nomorOdontogram.text))) {
        var existNomor = daftarPerubahanOdontogram.any((element) =>
            element['id'].toString().contains(nomorOdontogram.text));

        if (existNomor) {
          errorSnackBar(
              title: "Gagal Menambahkan",
              message: "Nomor odontogram yang di tuju sudah ada di dalam list");
        } else {
          successSnackBar(
              title: "Perubahan Ditambahkan",
              message: "Berhasil menambahkan odontogram ke dalam list");
          daftarPerubahanOdontogram.addIf(
            existNomor == false,
            {
              "id": "${nomorOdontogram.text}",
              "image": "${odontogramValue['image']}"
            },
          );

          print(odontogramValue);
        }
      } else {
        errorSnackBar(
            title: "Gagal Menambahkan", message: "Inputan Tidak Sesuai");
      }
    } catch (e) {}
  }

  @override
  void onInit() async {
    isLoading.value = true;
    try {
      idUser.value = Get.arguments['id_user'];
      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(idUser.value)
          .get();

      dataPasien.value = await user.data()!;
      odontogramPasien.value = await user.data()!['odontogram'];
    } on FirebaseException catch (e) {
      isLoading.value = false;
    }

    isLoading.value = false;
    super.onInit();
  }
}
