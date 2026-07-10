import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationService {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth _auth =
      FirebaseAuth.instance;




  Stream<QuerySnapshot> getNotifications() {

    final user = _auth.currentUser;

    if (user == null) {
      return const Stream.empty();
    }


    return _firestore
        .collection('notifications')
        .where(
      'userId',
      isEqualTo: user.uid,
    )
        .orderBy(
      'createdAt',
      descending: true,
    )
        .snapshots();

  }




  Future<void> markAsRead(String notificationId) async {

    await _firestore
        .collection('notifications')
        .doc(notificationId)
        .update({

      'isRead': true,

    });

  }



  // ساخت Notification جدید
  Future<void> createNotification({

    required String userId,
    required String title,
    required String message,

  }) async {


    await _firestore
        .collection('notifications')
        .add({

      'userId': userId,

      'title': title,

      'message': message,

      'isRead': false,

      'createdAt':
      FieldValue.serverTimestamp(),

    });


  }


}