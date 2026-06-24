import 'package:flutter/material.dart';
import '../../constants.dart';
import '../models/chat_model.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ChatTile({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF1B1B1B)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: kFirstColor,
                  child: Text(
                    chat.name[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kThirdColor,
                      fontSize: 18,
                    ),
                  ),
                ),

                if (chat.isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark
                              ? const Color(0xFF1B1B1B)
                              : Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDark
                          ? Colors.white60
                          : Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(
                    color: isDark
                        ? Colors.white54
                        : Colors.grey,
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 8),

                if (chat.unreadCount > 0)
                  Container(
                    width: 22,
                    height: 22,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kThirdColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}