class ChatModel {
  final String id;
  final String name;
  final String role;
  final String lastMessage;
  final String time;
  final String avatar;
  final bool isOnline;
  final int unreadCount;

  ChatModel({
    required this.id,
    required this.name,
    required this.role,
    required this.lastMessage,
    required this.time,
    required this.avatar,
    required this.isOnline,
    required this.unreadCount,
  });
}