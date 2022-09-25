import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/chats/views/widgets/chat_view_header.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  final controller = Get.put(ChatsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              ChatViewHeader(),
              SizedBox(
                height: 40,
              ),
              Obx(
                () => (controller.isLoading.isTrue)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : (controller.dataDokter.isEmpty &&
                            controller.dataPasien.isEmpty)
                        ? Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 3),
                            child: Center(
                              child: Text(
                                "Belum ada chat terkini",
                                style: secondaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                          )
                        : (controller.dataPasien.isEmpty)
                            // HALAMAN CHAT AKUN PASIEN
                            ? ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: [
                                  Text(
                                    "Chat terkini",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // [START] REALTIME CHAT DOKTER DI (AKUN PASIEN)
                                  StreamBuilder<
                                          QuerySnapshot<Map<String, dynamic>>>(
                                      stream: controller.chatDokter(
                                          controller.auth.currentUser!.uid),
                                      builder: (context, dataChatDokter) {
                                        if (dataChatDokter.connectionState ==
                                            ConnectionState.active) {
                                          var realtimeChatDokter =
                                              dataChatDokter.data!.docs;
                                          // [START] REALTIME PERUBAHAN YANG ADA DI DATA DOKTER
                                          if (dataChatDokter.data!.docs.length <
                                                  1 ||
                                              realtimeChatDokter.isEmpty) {
                                            return SizedBox();
                                          } else {
                                            return StreamBuilder<
                                                    QuerySnapshot<
                                                        Map<String, dynamic>>>(
                                                stream: controller.dokterStream(
                                                    realtimeChatDokter[0]
                                                        .data()['connection']),
                                                builder: (context,
                                                    dataProfileDokter) {
                                                  if (dataProfileDokter
                                                          .connectionState ==
                                                      ConnectionState.active) {
                                                    var profileDokter =
                                                        dataProfileDokter
                                                            .data!.docs[0]
                                                            .data();
                                                    if (dataProfileDokter.data!
                                                                .docs.length <
                                                            1 ||
                                                        profileDokter.isEmpty) {
                                                      return SizedBox();
                                                    } else {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          controller.addNewConnection(
                                                              realtimeChatDokter[
                                                                          0]
                                                                      .data()[
                                                                  'connection']);
                                                        },
                                                        child: ChatListCard(
                                                            name: profileDokter[
                                                                'nama_dokter'],
                                                            phoneNumber:
                                                                profileDokter[
                                                                    'nomor_dokter'],
                                                            chatCount:
                                                                realtimeChatDokter[
                                                                            0]
                                                                        .data()[
                                                                    'total_unread'],
                                                            imageUrl: profileDokter[
                                                                'image_dokter']),
                                                      );
                                                    }
                                                  } else {
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: primaryColor,
                                                      ),
                                                    );
                                                  }
                                                });
                                          }
                                          // [END] REALTIME PERUBAHAN YANG ADA DI DATA DOKTER
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: primaryColor,
                                            ),
                                          );
                                        }
                                      }),
                                  // [END] REALTIME CHAT DOKTER DI (AKUN PASIEN)
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "Dokter",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.addNewConnection(
                                          controller.dataDokter['dokter']
                                              ['email_dokter']);
                                    },
                                    child: ChatListUser(
                                        name: controller.dataDokter['dokter']
                                            ['nama_dokter'],
                                        imageUrl:
                                            controller.dataDokter['dokter']
                                                ['image_dokter']),
                                  )
                                ],
                              )
                            :
                            // HALAMAN CHAT AKUN DOKTER
                            ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: [
                                  Text(
                                    "Chat terkini",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // [START] REALTIME CHAT PASIEN DI (AKUN DOKTER)
                                  StreamBuilder<
                                          QuerySnapshot<Map<String, dynamic>>>(
                                      stream: controller.chatPasien(
                                          controller.auth.currentUser!.uid),
                                      builder: (context, dataChatPasien) {
                                        if (dataChatPasien.connectionState ==
                                            ConnectionState.active) {
                                          var realTimeChatPasien =
                                              dataChatPasien.data!.docs;
                                          // [START] REALTIME PERUBAHAN YANG ADA DI DATA PASIEN
                                          if (dataChatPasien.data!.docs.length <
                                                  1 ||
                                              realTimeChatPasien.isEmpty) {
                                            return SizedBox();
                                          } else {
                                            return ListView.builder(
                                                shrinkWrap: true,
                                                physics: ScrollPhysics(),
                                                itemCount:
                                                    realTimeChatPasien.length,
                                                itemBuilder: (context,
                                                    indexRealtimeChatPasien) {
                                                  return StreamBuilder<
                                                          QuerySnapshot<
                                                              Map<String,
                                                                  dynamic>>>(
                                                      stream: controller.pasienStream(
                                                          realTimeChatPasien[
                                                                  indexRealtimeChatPasien]
                                                              ['connection']),
                                                      builder: (context,
                                                          dataProfilePasien) {
                                                        if (dataProfilePasien
                                                                .connectionState ==
                                                            ConnectionState
                                                                .active) {
                                                          var profilePasien =
                                                              dataProfilePasien
                                                                  .data!.docs;
                                                          return ListView
                                                              .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      ScrollPhysics(),
                                                                  itemCount:
                                                                      profilePasien
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        controller.addNewConnection(realTimeChatPasien[indexRealtimeChatPasien]
                                                                            [
                                                                            'connection']);
                                                                      },
                                                                      child: ChatListCard(
                                                                          name: profilePasien[index]
                                                                              [
                                                                              'username'],
                                                                          phoneNumber:
                                                                              "${profilePasien[index]['telepon']}",
                                                                          chatCount: realTimeChatPasien[indexRealtimeChatPasien]
                                                                              [
                                                                              'total_unread'],
                                                                          imageUrl:
                                                                              ""),
                                                                    );
                                                                  });
                                                        } else {
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  primaryColor,
                                                            ),
                                                          );
                                                        }
                                                      });
                                                });
                                          }
                                          // [END] REALTIME PERUBAHAN YANG ADA DI DATA PASIEN
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: primaryColor,
                                            ),
                                          );
                                        }
                                      }),
                                  // [END] REALTIME CHAT PASIEN DI (AKUN DOKTER)
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    "Daftar Pasien",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.dataPasien.length,
                                      itemBuilder: (context, index) {
                                        // return Container();
                                        return GestureDetector(
                                          onTap: () {
                                            controller.addNewConnection(
                                                controller.dataPasien[index]
                                                    ['pasien']['email_pasien']);
                                            // print(controller.dataPasien[index]
                                            //     ['pasien']['email_pasien']);
                                          },
                                          child: ChatListUser(
                                              name: controller.dataPasien[index]
                                                  ['pasien']['nama_pasien'],
                                              imageUrl: ""),
                                        );
                                      })
                                ],
                              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatListCard extends StatelessWidget {
  ChatListCard({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.chatCount,
    required this.imageUrl,
  }) : super(key: key);
  final String name;
  final String phoneNumber;
  final int chatCount;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Material(
        shadowColor: primaryColor.withOpacity(0.5),
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(defaultMargin)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              (imageUrl.isNotEmpty)
                  ? Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.fitHeight)),
                    )
                  : CircleAvatar(
                      radius: 27,
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: backgroundColor,
                      ),
                    ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "$phoneNumber",
                      style: secondaryTextStyle.copyWith(
                          fontSize: 13, fontWeight: light),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              (chatCount < 1)
                  ? SizedBox()
                  : Material(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              (chatCount > 99) ? "99+" : "$chatCount",
                              style: primaryTextStyle.copyWith(
                                fontSize: 11,
                                fontWeight: semiBold,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatListUser extends StatelessWidget {
  ChatListUser({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);
  final String name;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Material(
        shadowColor: primaryColor.withOpacity(0.5),
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(defaultMargin)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              (imageUrl.isNotEmpty)
                  ? Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.fitHeight)),
                    )
                  : CircleAvatar(
                      radius: 27,
                      backgroundColor: primaryColor,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: backgroundColor,
                      ),
                    ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Kirim Pesan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: semiBold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
