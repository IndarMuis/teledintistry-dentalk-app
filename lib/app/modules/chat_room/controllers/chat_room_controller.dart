import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatRoomController extends GetxController {
  late TextEditingController chatController;
  late FocusNode focusNode;
  var openEmoji = false.obs;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  int total_unread = 0;
  late ScrollController scrollController;

  var friendEmail = "".obs;
  var chatId = "".obs;

  chatDokterFromWhatsApp(String number) async {
    var whatsappURl_android = "whatsapp://send?phone=$number&text=hello";

    await launchUrl(Uri.parse(whatsappURl_android));
  }

  Future<Map<String, dynamic>> dataFriend() async {
    // var friendEmail = await Get.arguments['friend_email'];
    var pasien = await _firestore
        .collection("users")
        .where("email", isEqualTo: friendEmail.value)
        .get();

    var dokter = await _firestore
        .collection("dokter")
        .where("email_dokter", isEqualTo: friendEmail.value)
        .get();

    var existPasien = await existingUser(auth.currentUser!.uid);

    if (existPasien) {
      return dokter.docs.first.data();
    } else {
      return pasien.docs.first.data();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamChats() {
    CollectionReference chats = _firestore.collection("chats");

    return chats
        .doc(chatId.value)
        .collection("chat")
        .orderBy("time")
        .snapshots();
  }

  void test(String email) async {
    var data = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    print(data.docs[0].data()['uid']);
  }

  Future<bool> existingUser(String uid) async {
    CollectionReference users = await _firestore.collection("users");

    var existUser = await users.doc(uid).get();

    if (existUser.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  void addEmoji(Emoji emoji) {
    chatController.text = chatController.text + emoji.emoji;
  }

  void deleteEmoji() {
    chatController.text =
        chatController.text.substring(0, chatController.text.length - 2);
  }

  void newChat(
      {required Map<String, dynamic> argument,
      required String email,
      required String chat}) async {
    CollectionReference chats = _firestore.collection("chats");
    CollectionReference users = _firestore.collection("users");
    CollectionReference dokter = _firestore.collection("dokter");

    var isPasien = await existingUser(auth.currentUser!.uid);
    String date = DateTime.now().toIso8601String();

    if (chatController.text.isNotEmpty) {
      if (isPasien) {
        await users
            .doc(auth.currentUser!.uid)
            .collection("chats")
            .doc(chatId.value)
            .update({
          "lastTime": date,
        });
      } else {
        await dokter
            .doc(auth.currentUser!.uid)
            .collection("chats")
            .doc(chatId.value)
            .update({
          "lastTime": date,
        });
      }

      if (isPasien) {
        // PASIEN CHAT DOKTER

        final getDataFriend = await dokter
            .where("email_dokter", isEqualTo: friendEmail.value)
            .get();

        final uidFriend =
            (getDataFriend.docs[0].data() as Map<String, dynamic>)['id_dokter'];

        final checkChatsFriend = await dokter
            .doc(uidFriend)
            .collection("chats")
            .doc(chatId.value)
            .get();

        if (checkChatsFriend.exists) {
          var cekTotalUnread = await chats
              .doc(chatId.value)
              .collection("chat")
              .where("isRead", isEqualTo: false)
              .where("pengirim", isEqualTo: email)
              .get();
          total_unread = cekTotalUnread.docs.length;

          await dokter
              .doc(uidFriend)
              .collection("chats")
              .doc(chatId.value)
              .update({
            "lastTime": date,
            "total_unread": total_unread + 1,
          });
          await chats.doc(chatId.value).collection("chat").add({
            "pengirim": email,
            "penerima": argument['friend_email'],
            "chat": chat,
            "time": date,
            "isRead": false,
            "groupTime":
                DateFormat.yMMMMd('en_US').format(DateTime.parse(date)),
          });
        } else {
          await dokter
              .doc(uidFriend)
              .collection("chats")
              .doc(chatId.value)
              .set({
            "connection": email,
            "lastTime": date,
            "total_unread": 1,
          });
          await chats.doc(chatId.value).collection("chat").add({
            "pengirim": email,
            "penerima": argument['friend_email'],
            "chat": chat,
            "time": date,
            "isRead": false,
            "groupTime":
                DateFormat.yMMMMd('en_US').format(DateTime.parse(date)),
          });
        }
        print("BERHASIL MENGHUBUNGI DOKTER");
        Timer(
            Duration.zero,
            () => scrollController
                .jumpTo(scrollController.position.maxScrollExtent));
        chatController.clear();
      } else {
        // DOKTER CHAT PASIEN
        final getDataFriend = await users
            .where("email", isEqualTo: argument['friend_email'])
            .get();

        final uidFriend =
            (getDataFriend.docs[0].data() as Map<String, dynamic>)['uid'];

        final checkChatsFriend = await users
            .doc(uidFriend)
            .collection("chats")
            .doc(chatId.value)
            .get();

        if (checkChatsFriend.exists) {
          print("sudah ada sebelumnya");

          var cekTotalUnread = await chats
              .doc(chatId.value)
              .collection("chat")
              .where("isRead", isEqualTo: false)
              .where("pengirim", isEqualTo: email)
              .get();
          total_unread = cekTotalUnread.docs.length;
          print(total_unread);

          await users
              .doc(uidFriend)
              .collection("chats")
              .doc(chatId.value)
              .update({
            "lastTime": date,
            "total_unread": total_unread + 1,
          });

          await chats.doc(chatId.value).collection("chat").add({
            "pengirim": email,
            "penerima": argument['friend_email'],
            "chat": chat,
            "time": date,
            "isRead": false,
            "groupTime":
                DateFormat.yMMMMd('en_US').format(DateTime.parse(date)),
          });
        } else {
          print("buat baru");
          await users.doc(uidFriend).collection("chats").doc(chatId.value).set({
            "connection": email,
            "lastTime": date,
            "total_unread": 1,
          });
          await chats.doc(chatId.value).collection("chat").add({
            "pengirim": email,
            "penerima": argument['friend_email'],
            "chat": chat,
            "time": date,
            "isRead": false,
            "groupTime":
                DateFormat.yMMMMd('en_US').format(DateTime.parse(date)),
          });
        }
        Timer(
            Duration.zero,
            () => scrollController
                .jumpTo(scrollController.position.maxScrollExtent));
        chatController.clear();
        print("BERHASIL MENGHUBUNGI PASIEN");
      }
    }
  }

  @override
  void onInit() {
    print("Get arguments");
    print(Get.arguments);
    friendEmail.value = Get.arguments['friend_email'];
    chatId.value = Get.arguments['chat_id'];

    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        openEmoji.value = false;
      }
    });

    chatController = TextEditingController();
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    chatController.dispose();
    scrollController.dispose();
    focusNode.dispose();
  }
}
