import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/theme.dart';
import 'package:intl/intl.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          elevation: 0,
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            borderRadius: BorderRadius.circular(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_back_ios_new,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                FutureBuilder<Map<String, dynamic>>(
                    future: controller.dataFriend(
                        email: Get.arguments['friend_email']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var dataImageUser = snapshot.data!['image'];
                        var dataImageDokter = snapshot.data!['image_dokter'];
                        if (dataImageUser != "" && dataImageUser != null) {
                          print("image user ada");
                          return Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                                image: DecorationImage(
                                    image: NetworkImage(dataImageUser),
                                    fit: BoxFit.fitHeight)),
                          );
                        } else if (dataImageDokter != "" &&
                            dataImageDokter != null) {
                          return Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: primaryColor),
                                image: DecorationImage(
                                    image: NetworkImage(dataImageDokter),
                                    fit: BoxFit.fitHeight)),
                          );
                        } else {
                          return CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 25,
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: backgroundColor,
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
                    })
              ],
            ),
          ),
          title: WillPopScope(
            onWillPop: () {
              if (controller.openEmoji.isTrue) {
                controller.openEmoji.value = false;
              } else {
                Get.back();
              }
              return Future.value(false);
            },
            child: FutureBuilder<Map<String, dynamic>>(
                future:
                    controller.dataFriend(email: Get.arguments['friend_email']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var cekPasien = snapshot.data!['user_role'];
                    var data = snapshot.data;
                    if (cekPasien == "user") {
                      return Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data!['username']}',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: bold,
                                    )),
                                Text('${data['telepon']}',
                                    style: secondaryTextStyle.copyWith(
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 20,
                              child: Icon(
                                Icons.whatsapp,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data!['nama_dokter']}',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: bold,
                                    )),
                                Text('${data['email_dokter']}',
                                    style: secondaryTextStyle.copyWith(
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 20,
                              child: Icon(
                                Icons.whatsapp,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          )
                        ],
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
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                margin: EdgeInsets.only(top: 5),
                width: Get.width,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: controller.streamChats(
                        chat_id: Get.arguments['chat_id']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          var allChats = snapshot.data!.docs;
                          Timer(
                              Duration.zero,
                              () => controller.scrollController.jumpTo(
                                  controller.scrollController.position
                                      .maxScrollExtent));
                          return ListView.builder(
                              controller: controller.scrollController,
                              itemCount: allChats.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${allChats[index]['groupTime']}",
                                        style: secondaryTextStyle.copyWith(
                                            fontSize: 13, fontWeight: bold),
                                      ),
                                      ItemChat(
                                        time: "${allChats[index]['time']}",
                                        isSender: (allChats[index]
                                                    ['pengirim'] ==
                                                controller
                                                    .auth.currentUser!.email)
                                            ? true
                                            : false,
                                        message: "${allChats[index]['chat']}",
                                      )
                                    ],
                                  );
                                } else {
                                  if (allChats[index]['groupTime'] ==
                                      allChats[index - 1]['groupTime']) {
                                    return ItemChat(
                                      time: "${allChats[index]['time']}",
                                      isSender: (allChats[index]['pengirim'] ==
                                              controller
                                                  .auth.currentUser!.email)
                                          ? true
                                          : false,
                                      message: "${allChats[index]['chat']}",
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("${allChats[index]['groupTime']}",
                                            style: secondaryTextStyle.copyWith(
                                                fontSize: 13,
                                                fontWeight: bold)),
                                        ItemChat(
                                          time: "${allChats[index]['time']}",
                                          isSender: (allChats[index]
                                                      ['pengirim'] ==
                                                  controller
                                                      .auth.currentUser!.email)
                                              ? true
                                              : false,
                                          message: "${allChats[index]['chat']}",
                                        )
                                      ],
                                    );
                                  }
                                }
                              });
                        } else {
                          return SizedBox();
                        }
                      } else {
                        return Center(
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 3),
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              )),
                        );
                      }
                    }),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              width: Get.width,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 15,
                right: 15,
              ),
              child: Row(children: [
                Expanded(
                    child: Container(
                  height: 50,
                  child: TextField(
                    controller: controller.chatController,
                    focusNode: controller.focusNode,
                    autocorrect: false,
                    maxLength: 200,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                      controller.focusNode.unfocus();
                      controller.newChat(
                          argument: Get.arguments as Map<String, dynamic>,
                          email: controller.auth.currentUser!.email.toString(),
                          chat: controller.chatController.text);
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: "Ketik Pesan",
                        contentPadding: EdgeInsets.only(top: 20),
                        prefixIcon: IconButton(
                            onPressed: () {
                              controller.focusNode.unfocus();
                              controller.openEmoji.toggle();
                            },
                            icon: Icon(
                              Icons.emoji_emotions_outlined,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () => controller.newChat(
                        argument: Get.arguments as Map<String, dynamic>,
                        email: controller.auth.currentUser!.email.toString(),
                        chat: controller.chatController.text),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.send,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Obx(
              () => (controller.openEmoji.isTrue)
                  ? Container(
                      height: 325,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          controller.addEmoji(emoji);
                        },
                        onBackspacePressed: () {
                          controller.deleteEmoji();
                        },
                        config: Config(
                          columns: 7,
                          emojiSizeMax:
                              30, // Issue: https://github.com/flutter/flutter/issues/28894
                          verticalSpacing: 0,
                          horizontalSpacing: 0,

                          initCategory: Category.RECENT,
                          bgColor: Color(0xFFF2F2F2),
                          indicatorColor: primaryColor,
                          iconColor: Colors.grey,
                          iconColorSelected: primaryColor,
                          progressIndicatorColor: primaryColor,
                          backspaceColor: primaryColor,
                          skinToneDialogBgColor: Colors.white,
                          skinToneIndicatorColor: Colors.grey,
                          enableSkinTones: true,
                          showRecentsTab: true,
                          recentsLimit: 28,
                          noRecents: const Text(
                            'No Recents',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black26),
                            textAlign: TextAlign.center,
                          ),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL,
                        ),
                      ))
                  : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
    required this.message,
    required this.time,
  }) : super(key: key);

  final bool isSender;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 2 - defaultMargin,
            ),
            decoration: BoxDecoration(
                border: isSender
                    ? Border.all(width: 0, color: primaryColor)
                    : Border.all(width: 0.5, color: primaryColor),
                color: isSender ? primaryColor : Colors.white,
                borderRadius: isSender
                    ? BorderRadius.only(
                        topLeft: Radius.circular(defaultMargin),
                        topRight: Radius.circular(defaultMargin),
                        bottomLeft: Radius.circular(defaultMargin))
                    : BorderRadius.only(
                        topLeft: Radius.circular(defaultMargin),
                        topRight: Radius.circular(defaultMargin),
                        bottomRight: Radius.circular(defaultMargin))),
            child: Text(
              "$message",
              style: primaryTextStyle.copyWith(
                color: isSender ? Colors.white : primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            DateFormat.jm().format(DateTime.parse(time)),
            style: secondaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
