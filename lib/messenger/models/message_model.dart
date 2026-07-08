import '../widgets/message_status_widget.dart';

class MessageModel {
  final String id;
  final String text;
  final String time;
  final bool isMe;
  final String senderId;
  final String senderName;
  final String senderPhoto;
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
    this.senderName = '',
    this.senderPhoto = '',
    this.status = MessageStatus.sent,
    this.createdAt,
    this.isEdited = false,
    this.isDeleted = false,
  });
}