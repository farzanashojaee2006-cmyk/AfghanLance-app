import 'package:flutter/material.dart';
import '../../constants.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        12,
        10,
        12,
        20,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF181818)
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF232323)
                    : kLightColor,
                borderRadius:
                BorderRadius.circular(18),
              ),
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: isDark
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    color: isDark
                        ? Colors.white38
                        : Colors.black38,
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: 10),

          Container(
            decoration: const BoxDecoration(
              color: kThirdColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: onSend,
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}