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
        .where('participants', arrayContains: currentUserId)
        .orderBy('lastMessageTime', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
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

    await _firestore.collection('chats').doc(chatId).set({
      'chatId': chatId,
      'participants': [currentUserId, otherUserId],
      'lastMessage': text.trim(),
      'lastMessageSenderId': currentUserId,
      'lastMessageTime': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    await messageRef.set({
      'messageId': messageRef.id,
      'senderId': currentUserId,
      'receiverId': otherUserId,
      'text': text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
      'status': 'sent',
      'isDeleted': false,
      'isEdited': false,
    });
  }

  Stream<QuerySnapshot> getBroadcastMessages() {
    return _firestore
        .collection('broadcast_messages')
        .orderBy('date', descending: true)
        .snapshots();
  }

  Future<void> sendBroadcastMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userDoc = await _firestore
        .collection('users')
        .doc(currentUserId)
        .get();

    final userData = userDoc.data();

    await _firestore.collection('broadcast_messages').add({
      'senderId': currentUserId,
      'senderName':
          '${userData?['firstName'] ?? ''} ${userData?['lastName'] ?? ''}'
              .trim(),
      'text': text.trim(),
      'date': FieldValue.serverTimestamp(),
    });
  }
}
