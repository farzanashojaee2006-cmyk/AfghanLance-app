import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../profile/profile_page.dart';
import '../models/message_model.dart';
import '../services/chat_service.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';
import '../widgets/message_status_widget.dart';

class ChatPage extends StatefulWidget {
  final String userName;
  final bool isOnline;
  final String otherUserId;

  const ChatPage({
    super.key,
    required this.userName,
    required this.isOnline,
    required this.otherUserId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ChatService _chatService = ChatService();

  void sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    final text = _controller.text.trim();
    _controller.clear();

    await _chatService.sendMessage(
      otherUserId: widget.otherUserId,
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        titleSpacing: 0,

        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProfilePage(
                    userId: widget.otherUserId,
                    isClient: false,
                  )
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: kThirdColor,
                child: Text(
                  widget.userName[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.userName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    widget.isOnline ? "Online" : "Offline",
                    style: TextStyle(
                      fontSize: 12,
                      color: widget.isOnline ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatService.getMessages(
                _chatService.getChatId(widget.otherUserId),
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: kThirdColor),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No messages yet"),
                  );
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;

                    final isMe =
                        data['senderId'] == _chatService.currentUserId;

                    final timestamp = data['createdAt'] as Timestamp?;
                    final time = timestamp == null
                        ? ''
                        : '${timestamp.toDate().hour}:${timestamp.toDate().minute.toString().padLeft(2, '0')}';

                    return MessageBubble(
                      message: MessageModel(
                        id: data['messageId'] ?? '',
                        text: data['text'] ?? '',
                        time: time,
                        isMe: isMe,
                        senderId: data['senderId'] ?? '',
                        status: MessageStatus.sent,
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
