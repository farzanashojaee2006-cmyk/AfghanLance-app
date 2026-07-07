import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../profile/profile_page.dart';
import '../models/message_model.dart';
import 'message_status_widget.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bubble = Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .68,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: message.isMe
            ? kThirdColor
            : isDark
            ? const Color(0xFF232323)
            : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(18),
          topRight: const Radius.circular(18),
          bottomLeft: Radius.circular(message.isMe ? 18 : 4),
          bottomRight: Radius.circular(message.isMe ? 4 : 18),
        ),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: message.isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!message.isMe && message.senderName.isNotEmpty) ...[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ProfilePage(userId: message.senderId, isClient: false),
                  ),
                );
              },
              child: Text(
                message.senderName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white70 : kThirdColor,
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
          Text(
            message.text,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: message.isMe
                  ? Colors.white
                  : isDark
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 11,
                  color: message.isMe
                      ? Colors.white70
                      : isDark
                      ? Colors.white38
                      : Colors.black38,
                ),
              ),
              if (message.isMe) ...[
                const SizedBox(width: 4),
                MessageStatusWidget(status: message.status),
              ],
            ],
          ),
        ],
      ),
    );

    if (message.isMe) {
      return Align(alignment: Alignment.centerRight, child: bubble);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ProfilePage(userId: message.senderId, isClient: false),
                ),
              );
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: kThirdColor,
              child: Icon(Icons.person, size: 20, color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          bubble,
        ],
      ),
    );
  }
}
