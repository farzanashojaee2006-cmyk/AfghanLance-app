import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../models/chat_model.dart';
import '../services/chat_service.dart';
import '../widgets/chat_tile.dart';
import 'chat_page.dart';
import 'new_message_page.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});

  final ChatService _chatService = ChatService();

  String formatTime(Timestamp? timestamp) {
    if (timestamp == null) return '';

    final date = timestamp.toDate();

    return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Messages',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              SizedBox(height: 6),

              Text(
                'Connect with clients and freelancers',
                style: TextStyle(
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1B1B1B) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search, color: kThirdColor),
                    hintText: 'Search messages...',
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white38 : Colors.black38,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 22),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _chatService.getUserChats(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: kThirdColor),
                      );
                    }

                    if (snapshot.hasError) {
                      debugPrint(snapshot.error.toString());

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            snapshot.error.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isDark ? Colors.white70 : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text(
                          'No chats yet',
                          style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      );
                    }

                    final chats = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        final chatData =
                            chats[index].data() as Map<String, dynamic>;

                        final participants = List<String>.from(
                          chatData['participants'] ?? [],
                        );

                        final otherUserId = participants.firstWhere(
                          (id) => id != _chatService.currentUserId,
                          orElse: () => '',
                        );

                        if (otherUserId.isEmpty) {
                          return SizedBox.shrink();
                        }

                        return FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('users')
                              .doc(otherUserId)
                              .get(),
                          builder: (context, userSnapshot) {
                            if (!userSnapshot.hasData) {
                              return SizedBox.shrink();
                            }

                            if (!userSnapshot.data!.exists) {
                              return SizedBox.shrink();
                            }

                            final userData =
                                userSnapshot.data!.data()
                                    as Map<String, dynamic>;

                            final name =
                                '${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}'
                                    .trim();

                            final time = formatTime(
                              chatData['lastMessageTime'] as Timestamp?,
                            );

                            return ChatTile(
                              chat: ChatModel(
                                id: otherUserId,
                                name: name.isEmpty ? 'User' : name,
                                role: userData['role'] ?? '',
                                lastMessage: chatData['lastMessage'] ?? '',
                                time: time,
                                avatar: userData['profileImage'] ?? '',
                                isOnline: false,
                                unreadCount: 0,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatPage(
                                      userName: name.isEmpty ? 'User' : name,
                                      isOnline: false,
                                      otherUserId: otherUserId,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
