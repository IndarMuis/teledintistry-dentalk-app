import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class CompleteDaftarProgramController extends GetxController {
  var listDokter = [].obs;

  var listDokterValue = {}.obs;
  var isLoading = false.obs;

  var dataProgram = {}.obs;
  var dataUser = {}.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  daftar() async {
    isLoading.value = true;
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection("pasien")
        .doc(auth.currentUser!.uid)
        .get();
    if (listDokterValue.isNotEmpty) {
      if (!ds.exists) {
        await FirebaseFirestore.instance
            .collection("pasien")
            .doc(auth.currentUser!.uid)
            .set({
          "dokter": {
            "id_dokter": listDokterValue["id_dokter"],
            "image_dokter": listDokterValue['image_dokter'],
            "email_dokter": listDokterValue['email_dokter'],
            "nama_dokter": listDokterValue['nama_dokter'],
          },
          "pasien": {
            "id_user": auth.currentUser!.uid,
            "nama_pasien": dataUser['username'],
            "email_pasien": dataUser['email'],
            "alamat_pasien": dataUser['alamat'],
            "telepon_pasien": dataUser['telepon'],
            "umur_pasien": dataUser['umur'],
          },
          "program": {
            "id_program": dataProgram['id_program'],
            "nama_program": dataProgram['nama_program'],
            "waktu_pemeriksaan_program":
                dataProgram['waktu_pemeriksaan_program'],
            "tanggal_daftar_program":
                DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now()),
          },
          "notifikasi": {}
        });
        await successSnackBar(
            title: "Successful Program Registration",
            message:
                "Sukses Mendaftar Pada Program ${dataProgram['nama_program']}");
        Get.offAllNamed(Routes.MAIN);
      } else {
        await errorSnackBar(
            title: "Failed To Register Program",
            message:
                "Silahkan selesaikan program yang telah berjalan sebelumnya");
        isLoading.value = false;
        return;
      }
    } else {
      await errorSnackBar(
          title: "Failed To Register Program",
          message: "Silahkan Pilih Dokter Terlebih Dahulu");
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    var dokterCollection =
        await FirebaseFirestore.instance.collection("dokter");
    var userCollection = await FirebaseFirestore.instance.collection("users");

    var daftarDokter = await dokterCollection;
    var user = await userCollection.doc(auth.currentUser!.uid).get();

    dataUser.value = user.data()!;

    await daftarDokter.get().then((value) {
      value.docs.forEach((element) {
        listDokter.add(element.data());
      });
    });

    dataProgram.value = Get.arguments;

    print(dataUser);

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
