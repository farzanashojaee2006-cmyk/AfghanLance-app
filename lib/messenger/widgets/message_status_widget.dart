import 'package:flutter/material.dart';

enum MessageStatus {
  sending,
  sent,
  delivered,
  seen,
}

class MessageStatusWidget extends StatelessWidget {
  final MessageStatus status;

  const MessageStatusWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case MessageStatus.sending:
        return SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        );

      case MessageStatus.sent:
        return const Icon(
          Icons.check,
          size: 16,
          color: Colors.grey,
        );

      case MessageStatus.delivered:
        return const Icon(
          Icons.done_all,
          size: 16,
          color: Colors.grey,
        );

      case MessageStatus.seen:
        return const Icon(
          Icons.done_all,
          size: 16,
          color: Color(0xFF3B82F6),
        );
    }
  }
}