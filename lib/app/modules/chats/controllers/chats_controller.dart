import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/routes/app_pages.dart';

class ChatsController extends GetxController {
  var dataDokter = {}.obs;
  var dataPasien = [].obs;

  var dataChatFriend = {};

  var isLoading = false.obs;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // REALTIME CHAT DOKTER DI AKUN PASIEN
  Stream<QuerySnapshot<Map<String, dynamic>>> chatDokter(String uid) {
    var dataUser = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("chats")
        .orderBy("lastTime", descending: true)
        .snapshots();
    return dataUser;
  }

  // REALTIME CHAT PASIEN DI AKUN DOKTER
  Stream<QuerySnapshot<Map<String, dynamic>>> chatPasien(String uid) {
    var dataUser = FirebaseFirestore.instance
        .collection("dokter")
        .doc(uid)
        .collection("chats")
        .orderBy("lastTime", descending: true)
        .snapshots();
    return dataUser;
  }

  // REALTIME PERUBAHAN YANG ADA DI DATA DOKTER
  Stream<QuerySnapshot<Map<String, dynamic>>> dokterStream(String email) {
    var dataUser = FirebaseFirestore.instance
        .collection("dokter")
        .where("email_dokter", isEqualTo: email)
        .snapshots();
    return dataUser;
  }

  // REALTIME PERUBAHAN YANG ADA DI DATA PASIEN
  Stream<QuerySnapshot<Map<String, dynamic>>> pasienStream(String email) {
    var dataUser = FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .snapshots();
    return dataUser;
  }

  Future<bool> existingUser(String uid) async {
    CollectionReference users = await _firestore.collection("users");
    CollectionReference dokter = await _firestore.collection("dokter");

    var existUser = await users.doc(uid).get();

    if (existUser.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addNewConnection(String friendEmail) async {
    String? chat_id;
    bool flagNewConnection = false;
    var existPasien = await existingUser(auth.currentUser!.uid);
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = _firestore.collection("chats");
    CollectionReference users = _firestore.collection("users");
    CollectionReference dokter = _firestore.collection("dokter");

    var docChatPasien =
        await users.doc(auth.currentUser!.uid).collection("chats").get();
    var docChatDokter =
        await dokter.doc(auth.currentUser!.uid).collection("chats").get();

    if (existPasien) {
      // docChat = (docUser.data() as Map<String, dynamic>)['chats'] as List;
      if (docChatPasien.docs.length != 0) {
        print("user belum pernah chat dengan siapapun");
        final checkConnection = await users
            .doc(auth.currentUser!.uid)
            .collection("chats")
            .where("connection", isEqualTo: friendEmail)
            .get();
        if (checkConnection.docs.length != 0) {
          print("Sudah membuat koneksi sebelumnya");
          // Sudah membuat koneksi sebelumnya
          flagNewConnection = false;

          // chat id from chats collections
          chat_id = checkConnection.docs[0].id;
        } else {
          print("blm pernah buat koneksi dengan => friendEmail");
          // Belum pernah membuat koneksi sebelumnya
          flagNewConnection = true;
        }
      } else {
        print("blm pernah chat dengan siapapun");
        // Belum pernah chat dengan siapapun
        flagNewConnection = true;
      }
    } else {
      if (docChatDokter.docs.length != 0) {
        final checkConnection = await dokter
            .doc(auth.currentUser!.uid)
            .collection("chats")
            .where("connection", isEqualTo: friendEmail)
            .get();
        if (checkConnection.docs.length != 0) {
          // Sudah membuat koneksi sebelumnya
          flagNewConnection = false;

          // chat id from chats collections
          chat_id = checkConnection.docs[0].id;
        } else {
          // Belum pernah membuat koneksi sebelumnya
          flagNewConnection = true;
        }
      } else {
        // Belum pernah chat dengan siapapun
        flagNewConnection = true;
      }
    }

    // FIXING
    if (flagNewConnection) {
      // cek dari data chats apakah mereka berdua memiliki koneksi
      final chatsDocs = await chats.where("connections", whereIn: [
        [
          auth.currentUser!.email,
          friendEmail,
        ],
        [
          friendEmail,
          auth.currentUser!.email,
        ],
      ]).get();

      if (chatsDocs.docs.length != 0) {
        final chatDataId = chatsDocs.docs[0].id;
        final chatData = chatsDocs.docs[0].data() as Map<String, dynamic>;

        if (existPasien) {
          print("masuk disini");
          await users
              .doc(auth.currentUser!.uid)
              .collection("chats")
              .doc(chatDataId)
              .set({
            "connection": friendEmail,
            "chat_id": chatDataId,
            "lastTime": date,
            "total_unread": 0,
          });
        } else {
          print("masuk dokter");
          await dokter
              .doc(auth.currentUser!.uid)
              .collection("chats")
              .doc(chatDataId)
              .set({
            "connection": friendEmail,
            "chat_id": chatDataId,
            "lastTime": date,
            "total_unread": 0,
          });
        }

        chat_id = chatDataId;
      } else {
        // Buat baru, mereka berdua benar2 belum ada koneksi
        final newChatDoc = await chats.add({
          "connections": [
            auth.currentUser!.email,
            friendEmail,
          ],
        });

        await chats.doc(newChatDoc.id).collection("chat");

        if (existPasien) {
          await users
              .doc(auth.currentUser!.uid)
              .collection("chats")
              .doc(newChatDoc.id)
              .set({
            "connection": friendEmail,
            "chat_id": newChatDoc.id,
            "lastTime": date,
            "total_unread": 0,
          });
        } else {
          await dokter
              .doc(auth.currentUser!.uid)
              .collection("chats")
              .doc(newChatDoc.id)
              .set({
            "connection": friendEmail,
            "chat_id": newChatDoc.id,
            "lastTime": date,
            "total_unread": 0,
          });
        }

        chat_id = newChatDoc.id;
      }
    }

    if (existPasien) {
      await users
          .doc(auth.currentUser!.uid)
          .collection("chats")
          .doc(chat_id)
          .update({
        "total_unread": 0,
      });
    } else {
      await dokter
          .doc(auth.currentUser!.uid)
          .collection("chats")
          .doc(chat_id)
          .update({
        "total_unread": 0,
      });
    }

    final updateStatusChat = await chats
        .doc(chat_id)
        .collection("chat")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: auth.currentUser!.email)
        .get();

    updateStatusChat.docs.forEach((element) async {
      await chats.doc(chat_id).collection("chat").doc(element.id).update({
        "isRead": true,
      });
    });

    Get.toNamed(Routes.CHAT_ROOM, arguments: {
      "chat_id": chat_id,
      "friend_email": friendEmail,
    });
  }

  @override
  void onInit() async {
    isLoading.value = true;
    var userId = auth.currentUser!.uid;
    var verifikasiDataUser = await existingUser(userId);

    var collection =
        await FirebaseFirestore.instance.collection("pasien").doc(userId).get();

    if (verifikasiDataUser) {
      if (collection.data() != null) {
        dataDokter.value = await collection.data()!;
      } else {
        dataDokter.value = {};
      }
    } else {
      var allPasien = await FirebaseFirestore.instance.collection("pasien");
      var data = await allPasien.get();
      if (data.docs.length < 1) {
        dataPasien.value = [];
      } else {
        data.docs.forEach((element) {
          dataPasien.add(element.data());
        });
      }
    }

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
