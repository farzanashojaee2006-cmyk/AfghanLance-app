import '../widgets/message_status_widget.dart';

enum MessageType { text, file, voice }

class MessageModel {
  final String id;
  final String text;
  final String time;
  final bool isMe;
  final String senderId;
  final MessageType type;
  final MessageStatus status;
  final DateTime? createdAt;
  final bool isEdited;
  final bool isDeleted;

  MessageModel({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
    required this.senderId,
    this.type = MessageType.text,
    this.status = MessageStatus.sent,
    this.createdAt,
    this.isEdited = false,
    this.isDeleted = false,

  });
}
