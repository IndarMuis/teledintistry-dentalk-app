import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var dataUser = {}.obs;
  var dataDokter = {}.obs;
  var isLoading = false.obs;

  Future<void> logOut() async {
    isLoading.value = true;
    await FirebaseAuth.instance.signOut();

    Get.offAllNamed(Routes.LOGIN);
    isLoading.value = false;
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
    print(dataUser);
    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
