

import 'package:flutter/material.dart';

import '../../../constants.dart';




class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "message": "Hello 👋\nHow can we help you today?",
      "isUser": false,
    },
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        "message": messageController.text.trim(),
        "isUser": true,
      });
    });

    String userMessage = messageController.text.trim();

    messageController.clear();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add({
          "message":
          "Thank you for contacting us.\nOur support team will reply shortly.",
          "isUser": false,
        });
      });
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  Widget buildMessage(Map<String, dynamic> message) {
    bool isUser = message["isUser"];

    return Align(
      alignment:
      isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message["message"],
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Chat"),
      ),
      body: Column(
        children: [

          Container(
            width: double.infinity,
            color: Colors.green.shade100,
            padding: const EdgeInsets.all(12),
            child: const Column(
              children: [
                Text(
                  "🟢 Support Online",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text("Average response time: 5 minutes"),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessage(messages[index]);
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(Icons.send,color: k4Color,size: 30,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
