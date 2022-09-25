import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class HistoriesController extends GetxController {
  var data = {}.obs;
  var dataUser = {}.obs;
  var isLoading = false.obs;

  hentikanProgram({String? idProgram}) async {
    isLoading.value = true;
    await FirebaseFirestore.instance
        .collection("pasien")
        .doc(idProgram)
        .delete();
    await successSnackBar(
        title: "BERHASIL", message: "Program telah dihentikan");
    Get.offAllNamed(Routes.MAIN);
    isLoading.value = false;
  }

  @override
  void onInit() async {
    isLoading.value = true;
    try {
      var userId = FirebaseAuth.instance;
      var dataPasien = await FirebaseFirestore.instance
          .collection("pasien")
          .doc(userId.currentUser!.uid)
          .get();

      var user = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId.currentUser!.uid)
          .get();

      if (dataPasien.data() != null) {
        data.value = dataPasien.data()!;
        dataUser.value = user.data()!;
        print(user.data());
      } else {
        data.value.clear();
      }
    } on FirebaseException catch (e) {
      print(e.message);
      isLoading.value = false;
    }

    isLoading.value = false;
    super.onInit();
  }
}
