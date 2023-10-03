import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/data/enums.dart';
import 'package:new_chat/features/chat/model/chat_contact.dart';
import 'package:new_chat/features/auth/model/user_model.dart';
import 'package:new_chat/utils/utils.dart';
import 'package:uuid/uuid.dart';

final chatRepositoryProvider = Provider((ref) {
  
});

class ChatRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ChatRepository({required this.auth, required this.firestore});

  Future<void> _saveDataToContactSubCollection(
    UserModel senderUserData,
    UserModel recieverUserData,
    String text,
    DateTime timeSent,
    String recieverUserId,
  ) async {
    var recieverChatContact = ChatContact(
      name: recieverUserData.name,
      profilePic: recieverUserData.profilePic,
      contactId: recieverUserData.uid,
      timeSent: timeSent,
      lastMessage: text,
    );

    await firestore
        .collection('user')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser?.uid)
        .set(
          recieverChatContact.toMap(),
        );

    var senderChatContact = ChatContact(
      name: recieverUserData.name,
      profilePic: recieverUserData.profilePic,
      contactId: recieverUserData.uid,
      timeSent: timeSent,
      lastMessage: text,
    );

    await firestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .set(
          senderChatContact.toMap(),
        );
  }

  void _saveMessageToMessageSubCollection(
      {required String recieverUserId,
      required String text,
      required DateTime timeSent,
      required String messageId,
      required String userName,
      required recieverUserName,
      required MessageEnum messagetype}) {
        
      }

  Future sendTextMessage({
    required String text,
    required BuildContext context,
    required String recieverUserId,
    required UserModel senderUserData,  
  }) async {
    try {
      var timeSent = DateTime.now();
      UserModel recieverUserdata;

      var messageId = const Uuid().v1();

      var userDataMap =
          await firestore.collection('user').doc(recieverUserId).get();
      recieverUserdata = UserModel.fromMap(userDataMap.data()!);

      _saveDataToContactSubCollection(
          senderUserData, recieverUserdata, text, timeSent, recieverUserId);

      _saveMessageToMessageSubCollection(
        recieverUserId: recieverUserId,
        text: text,
        timeSent: timeSent,
        messageId: messageId,
        userName: senderUserData.name,
        recieverUserName: recieverUserdata.name,
        messagetype: MessageEnum.text,
      );

    } catch (e) {
      Utils.showSnackBar(context: context, content: e.toString());
    }
  }
}
