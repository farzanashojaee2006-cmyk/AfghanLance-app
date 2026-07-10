import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get currentUserId => _auth.currentUser!.uid;


  String getChatId(String otherUserId) {
    final ids = [currentUserId, otherUserId];
    ids.sort();
    return ids.join('_');
  }


  Stream<QuerySnapshot> getUserChats() {
    return _firestore
        .collection('chats')
        .where(
      'participants',
      arrayContains: currentUserId,
    )
        .orderBy(
      'lastMessageTime',
      descending: true,
    )
        .snapshots();
  }


  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy(
      'createdAt',
      descending: true,
    )
        .snapshots();
  }



  Future<void> sendMessage({
    required String otherUserId,
    required String text,
  }) async {

    if (text.trim().isEmpty) return;


    final chatId = getChatId(otherUserId);


    final messageRef = _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc();



    try {

      // Save chat data
      await _firestore
          .collection('chats')
          .doc(chatId)
          .set({

        'chatId': chatId,

        'participants': [
          currentUserId,
          otherUserId,
        ],

        'lastMessage': text.trim(),

        'lastMessageSenderId': currentUserId,

        'lastMessageTime':
        FieldValue.serverTimestamp(),

        'updatedAt':
        FieldValue.serverTimestamp(),

      }, SetOptions(merge: true));




      // Save message
      await messageRef.set({

        'messageId': messageRef.id,

        'senderId': currentUserId,

        'receiverId': otherUserId,

        'text': text.trim(),

        'createdAt':
        FieldValue.serverTimestamp(),

        'status': 'sent',

        'isDeleted': false,

        'isEdited': false,

      });



      // Get sender information
      final senderDoc = await _firestore
          .collection('users')
          .doc(currentUserId)
          .get();


      final senderData = senderDoc.data();



      final senderName =
      '${senderData?['firstName'] ?? ''} ${senderData?['lastName'] ?? ''}'
          .trim();




      // Create notification
      await _firestore
          .collection('notifications')
          .add({

        'userId': otherUserId,

        'title': 'New Message',

        'message':
        '$senderName sent you a message',

        'isRead': false,

        'createdAt':
        FieldValue.serverTimestamp(),

      });



      print("Notification created successfully");


    } catch (e) {

      print("Send message error: $e");

    }

  }





  Stream<QuerySnapshot> getBroadcastMessages() {

    return _firestore
        .collection('broadcast_messages')
        .orderBy(
      'date',
      descending: true,
    )
        .snapshots();

  }





  Future<void> sendBroadcastMessage(String text) async {

    if (text.trim().isEmpty) return;


    final userDoc = await _firestore
        .collection('users')
        .doc(currentUserId)
        .get();


    final userData = userDoc.data();



    await _firestore
        .collection('broadcast_messages')
        .add({

      'senderId': currentUserId,

      'senderName':
      '${userData?['firstName'] ?? ''} ${userData?['lastName'] ?? ''}'
          .trim(),

      'text': text.trim(),

      'date':
      FieldValue.serverTimestamp(),

    });

  }

}