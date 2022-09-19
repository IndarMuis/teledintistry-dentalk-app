import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/profile/views/widgets/profile_dokter_content.dart';
import 'package:teledintistry/app/modules/profile/views/widgets/profile_header.dart';
import 'package:teledintistry/app/modules/profile/views/widgets/profile_user_content.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  var controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: (controller.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              : (controller.dataUser.isEmpty)
                  ? ProfileDokterContent()
                  : ProfileUserContent(),
        ),
      )),
    );
  }
}
