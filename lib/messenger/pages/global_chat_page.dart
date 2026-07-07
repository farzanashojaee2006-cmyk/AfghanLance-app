import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../models/message_model.dart';
import '../services/chat_service.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class GlobalChatPage extends StatefulWidget {
  const GlobalChatPage({super.key});

  @override
  State<GlobalChatPage> createState() => _GlobalChatPageState();
}

class _GlobalChatPageState extends State<GlobalChatPage> {
  final ChatService _chatService = ChatService();
  final TextEditingController _controller = TextEditingController();

  Future<void> sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    final text = _controller.text.trim();
    _controller.clear();

    await _chatService.sendBroadcastMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        title: const Text('🌍 Global Chat'),
      ),

      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatService.getBroadcastMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;

                    final isMe = data['senderId'] == _chatService.currentUserId;

                    final timestamp = data['date'] as Timestamp?;

                    final time = timestamp == null
                        ? ''
                        : '${timestamp.toDate().hour}:${timestamp.toDate().minute.toString().padLeft(2, '0')}';

                    return MessageBubble(
                      message: MessageModel(
                        id: docs[index].id,
                        text: data['text'] ?? '',
                        time: time,
                        isMe: isMe,
                        senderId: data['senderId'] ?? '',
                        senderName: data['senderName'] ?? '',
                      ),
                    );
                  },
                );
              },
            ),
          ),

          MessageInput(controller: _controller, onSend: sendMessage),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
