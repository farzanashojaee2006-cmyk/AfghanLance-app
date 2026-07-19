import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No notifications yet",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final notifications = snapshot.data!.docs;
          final notificationsList = [...notifications];

          notificationsList.sort((a, b) {

            final aTime = (a.data() as Map<String, dynamic>)['createdAt'];

            final bTime = (b.data() as Map<String, dynamic>)['createdAt'];

            if (aTime == null || bTime == null) {
              return 0;
            }

            return (bTime as Timestamp)
                .compareTo(aTime as Timestamp);

          });
          print("Notifications count: ${notifications.length}");

          for (var doc in notifications) {
            print(doc.data());
          }

          return ListView.builder(
            itemCount: notificationsList.length,
            itemBuilder: (context, index) {
              final doc = notificationsList[index];
              final data = doc.data() as Map<String, dynamic>;

              final bool isRead = data['isRead'] ?? false;

              String time = "";
              if (data['createdAt'] != null) {
                final timestamp = data['createdAt'] as Timestamp;
                final date = timestamp.toDate();

                time =
                "${date.day}/${date.month}/${date.year}";
              }

              return Dismissible(
                key: Key(doc.id),
                direction: DismissDirection.endToStart,

                background: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  padding: const EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                onDismissed: (direction) async {
                  await FirebaseFirestore.instance
                      .collection('notifications')
                      .doc(doc.id)
                      .delete();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Notification deleted"),
                    ),
                  );
                },

                child: Card(
                  color: isRead ? Colors.white : Colors.blue.shade50,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: ListTile(
                    onTap: () async {
                      if (!isRead) {
                        await FirebaseFirestore.instance
                            .collection('notifications')
                            .doc(doc.id)
                            .update({
                          'isRead': true,
                        });
                      }
                    },
                    leading: CircleAvatar(
                      backgroundColor:
                      isRead ? Colors.grey : Colors.blue,
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      data['title'] ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                        isRead ? Colors.grey : Colors.black,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(data['message'] ?? ''),
                        const SizedBox(height: 8),
                        Text(
                          time,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}