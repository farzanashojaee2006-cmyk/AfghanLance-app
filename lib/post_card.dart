import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String caption;
  final String username;

  const PostCard({
    super.key,
    required this.caption,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(caption),
          ],
        ),
      ),
    );
  }
}