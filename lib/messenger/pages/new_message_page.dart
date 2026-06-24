import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'chat_page.dart';

class NewMessagePage extends StatelessWidget {
  const NewMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,
        title: const Text("New Chat"),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No users found"));
          }

          final users = snapshot.data!.docs;
          final currentUserId = FirebaseAuth.instance.currentUser!.uid;

          final filteredUsers = users.where((doc) {
            return doc.id != currentUserId;
          }).toList();

          return ListView.builder(
            itemCount: filteredUsers.length,

            itemBuilder: (context, index) {
              final doc = filteredUsers[index];
              final user = doc.data() as Map<String, dynamic>;
              final otherUserId = doc.id;

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: kThirdColor,
                  child: Text(
                    (user['firstName'] ?? 'U')
                        .toString()
                        .substring(0, 1)
                        .toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                title: Text(
                  "${user['firstName'] ?? ''} ${user['lastName'] ?? ''}",
                ),

                subtitle: Text(user['role'] ?? ''),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatPage(
                        userName: "${user['firstName']} ${user['lastName']}",
                        isOnline: false,
                        otherUserId:otherUserId
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
