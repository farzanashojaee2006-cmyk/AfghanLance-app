import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../services/chat_service.dart';
import 'chat_page.dart';
import 'global_chat_page.dart';

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
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    final chats = snapshot.data?.docs ?? [];

                    return ListView(
                      children: [
                        Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: kThirdColor,
                              child: Icon(Icons.public, color: Colors.white),
                            ),
                            title: const Text(
                              'Global Chat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text('Chat with everyone'),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const GlobalChatPage(),
                                ),
                              );
                            },
                          ),
                        ),

                        if (chats.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(child: Text('No private chats yet')),
                          ),

                        ...List.generate(chats.length, (index) {
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
                            return const SizedBox.shrink();
                          }

                          return FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('users')
                                .doc(otherUserId)
                                .get(),
                            builder: (context, userSnapshot) {
                              if (!userSnapshot.hasData ||
                                  !userSnapshot.data!.exists) {
                                return const SizedBox.shrink();
                              }

                              final userData =
                                  userSnapshot.data!.data()
                                      as Map<String, dynamic>;

                              final name =
                                  '${userData['firstName'] ?? ''} '
                                          '${userData['lastName'] ?? ''}'
                                      .trim();

                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF1B1B1B)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),

                                  leading: CircleAvatar(
                                    radius: 26,
                                    backgroundColor: kThirdColor,
                                    child: Text(
                                      name.isNotEmpty
                                          ? name[0].toUpperCase()
                                          : 'U',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  title: Text(
                                    name.isEmpty ? 'User' : name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),

                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      chatData['lastMessage'] ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.white60
                                            : Colors.black54,
                                      ),
                                    ),
                                  ),

                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),

                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ChatPage(
                                          userName: name.isEmpty
                                              ? 'User'
                                              : name,
                                          isOnline: false,
                                          otherUserId: otherUserId,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }),
                      ],
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
