import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/helper_widget.dart';
import 'package:teledintistry/app/modules/notifikasi/views/widgets/notifikasi_header.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  final controller = Get.put(NotifikasiController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>?>(
            stream: controller.notifSteram(),
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.data();
                  var dataNotif = {};
                  if (data != null) {
                    dataNotif = data['notifikasi'] as Map<String, dynamic>;
                  } else {
                    dataNotif = {};
                  }
                  print(dataNotif);
                  if (dataNotif.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(defaultMargin),
                      child: ListView(
                        children: [
                          NotifikasiHeader(),
                          SizedBox(
                            height: 40,
                          ),
                          (dataNotif['resep'] == null)
                              ? SizedBox()
                              : Material(
                                  shadowColor:
                                      secondaryTextColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  elevation: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: primaryColor,
                                        )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "E-Resep",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: semiBold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "From : ${data!['dokter']['nama_dokter']}",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 15,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Document : ${data['notifikasi']['resep']['nama_file']}",
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 15,
                                                  color: primaryColor,
                                                  fontWeight: semiBold,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  dialogVerification(
                                                      onConfirm: () {
                                                        controller.openFile(
                                                            url: dataNotif[
                                                                    'resep']
                                                                ['file_resep'],
                                                            fileName: dataNotif[
                                                                    'resep']
                                                                ['nama_file']);
                                                      },
                                                      title: "Download File",
                                                      icon: Icons.download,
                                                      color: primaryColor,
                                                      isLoading: controller
                                                          .isLoading.value);
                                                },
                                                icon: Icon(
                                                  Icons.download,
                                                  size: 38,
                                                  color: primaryColor,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 30,
                          ),
                          (dataNotif['rujukan'] == null)
                              ? SizedBox()
                              : Material(
                                  shadowColor:
                                      secondaryTextColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  elevation: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: primaryColor,
                                        )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rujukan",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: semiBold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "From : ${data!['dokter']['nama_dokter']}",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 15,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Document : ${data['notifikasi']['rujukan']['nama_file']}",
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 15,
                                                  color: primaryColor,
                                                  fontWeight: semiBold,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  dialogVerification(
                                                      onConfirm: () {
                                                        controller.openFile(
                                                            url: dataNotif[
                                                                    'resep']
                                                                ['file_resep'],
                                                            fileName: dataNotif[
                                                                    'resep']
                                                                ['nama_file']);
                                                      },
                                                      title: "Download File",
                                                      icon: Icons.download,
                                                      color: primaryColor,
                                                      isLoading: controller
                                                          .isLoading.value);
                                                },
                                                icon: Icon(
                                                  Icons.download,
                                                  size: 38,
                                                  color: primaryColor,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(defaultMargin),
                      child: ListView(
                        children: [
                          NotifikasiHeader(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2.5,
                          ),
                          Center(
                            child: Text(
                              "Belum ada notifikasi terkini",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(defaultMargin),
                    child: ListView(
                      children: [
                        NotifikasiHeader(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.5,
                        ),
                        Center(
                          child: Text(
                            "Belum ada notifikasi terkini",
                            style: secondaryTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
            }),
        // body: Padding(
        //   padding: const EdgeInsets.all(defaultMargin),
        //   child: Obx(() => (controller.isLoading.isTrue)
        //       ? Center(
        //           child: CircularProgressIndicator(
        //             color: primaryColor,
        //           ),
        //         )
        //       : ((controller.dataNotifikasi).isEmpty)
        //           ? ListView(
        //               children: [
        //                 NotifikasiHeader(),
        //                 SizedBox(
        //                   height: MediaQuery.of(context).size.height / 2.5,
        //                 ),
        //                 Center(
        //                   child: Text(
        //                     "Belum ada notifikasi terkini",
        //                     style: secondaryTextStyle.copyWith(
        //                       fontSize: 18,
        //                       fontWeight: semiBold,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             )
        //           : ListView(
        //               children: [
        //                 NotifikasiHeader(),
        //                 SizedBox(
        //                   height: 40,
        //                 ),
        //                 ((controller.dataNotifikasi['notifikasi']
        //                             as Map)['resep'] ==
        //                         null)
        //                     ? SizedBox()
        //                     : Material(
        //                         shadowColor:
        //                             secondaryTextColor.withOpacity(0.5),
        //                         borderRadius: BorderRadius.circular(15),
        //                         elevation: 2,
        //                         child: Container(
        //                           padding: EdgeInsets.all(15),
        //                           decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(15),
        //                               color: Colors.white,
        //                               border: Border.all(
        //                                 color: primaryColor,
        //                               )),
        //                           child: Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               Text(
        //                                 "E-Resep",
        //                                 style: primaryTextStyle.copyWith(
        //                                   fontSize: 18,
        //                                   fontWeight: semiBold,
        //                                 ),
        //                                 overflow: TextOverflow.ellipsis,
        //                               ),
        //                               Text(
        //                                 "From : ${controller.dataNotifikasi['dokter']['nama_dokter']}",
        //                                 style: primaryTextStyle.copyWith(
        //                                   fontSize: 15,
        //                                 ),
        //                                 overflow: TextOverflow.ellipsis,
        //                               ),
        //                               SizedBox(
        //                                 height: 20,
        //                               ),
        //                               SizedBox(
        //                                 height: 5,
        //                               ),
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 children: [
        //                                   Expanded(
        //                                     child: Text(
        //                                       "Document : ${controller.dataNotifikasi['notifikasi']['resep']['nama_file']}",
        //                                       style: primaryTextStyle.copyWith(
        //                                         fontSize: 15,
        //                                         color: primaryColor,
        //                                         fontWeight: semiBold,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   IconButton(
        //                                       onPressed: () {
        //                                         dialogVerification(
        //                                             onConfirm: () {
        //                                               controller.openFile(
        //                                                   url: controller.dataNotifikasi[
        //                                                               'notifikasi']
        //                                                           ['resep']
        //                                                       ['file_resep'],
        //                                                   fileName: controller
        //                                                               .dataNotifikasi[
        //                                                           'notifikasi'][
        //                                                       'resep']['nama_file']);
        //                                             },
        //                                             title: "Download File",
        //                                             icon: Icons.download,
        //                                             color: primaryColor,
        //                                             isLoading: controller
        //                                                 .isLoading.value);
        //                                       },
        //                                       icon: Icon(
        //                                         Icons.download,
        //                                         size: 38,
        //                                         color: primaryColor,
        //                                       ))
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                 SizedBox(
        //                   height: 30,
        //                 ),
        //                 ((controller.dataNotifikasi['notifikasi']
        //                             as Map)['rujukan'] ==
        //                         null)
        //                     ? SizedBox()
        //                     : Material(
        //                         shadowColor:
        //                             secondaryTextColor.withOpacity(0.5),
        //                         borderRadius: BorderRadius.circular(15),
        //                         elevation: 2,
        //                         child: Container(
        //                           padding: EdgeInsets.all(15),
        //                           decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(15),
        //                               color: Colors.white,
        //                               border: Border.all(
        //                                 color: primaryColor,
        //                               )),
        //                           child: Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               Text(
        //                                 "Rujukan",
        //                                 style: primaryTextStyle.copyWith(
        //                                   fontSize: 18,
        //                                   fontWeight: semiBold,
        //                                 ),
        //                                 overflow: TextOverflow.ellipsis,
        //                               ),
        //                               Text(
        //                                 "From : ${controller.dataNotifikasi['dokter']['nama_dokter']}",
        //                                 style: primaryTextStyle.copyWith(
        //                                   fontSize: 15,
        //                                 ),
        //                                 overflow: TextOverflow.ellipsis,
        //                               ),
        //                               SizedBox(
        //                                 height: 20,
        //                               ),
        //                               SizedBox(
        //                                 height: 5,
        //                               ),
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 children: [
        //                                   Expanded(
        //                                     child: Text(
        //                                       "Document : ${controller.dataNotifikasi['notifikasi']['rujukan']['nama_file']}",
        //                                       style: primaryTextStyle.copyWith(
        //                                         fontSize: 15,
        //                                         color: primaryColor,
        //                                         fontWeight: semiBold,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   IconButton(
        //                                       onPressed: () {
        //                                         dialogVerification(
        //                                             onConfirm: () {
        //                                               controller.openFile(
        //                                                   url: controller.dataNotifikasi[
        //                                                               'notifikasi']
        //                                                           ['resep']
        //                                                       ['file_resep'],
        //                                                   fileName: controller
        //                                                               .dataNotifikasi[
        //                                                           'notifikasi'][
        //                                                       'resep']['nama_file']);
        //                                             },
        //                                             title: "Download File",
        //                                             icon: Icons.download,
        //                                             color: primaryColor,
        //                                             isLoading: controller
        //                                                 .isLoading.value);
        //                                       },
        //                                       icon: Icon(
        //                                         Icons.download,
        //                                         size: 38,
        //                                         color: primaryColor,
        //                                       ))
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //               ],
        //             )),
        // ),
      ),
    );
  }
}
