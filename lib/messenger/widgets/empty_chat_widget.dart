import 'package:flutter/material.dart';
import '../../constants.dart';

class EmptyChatWidget extends StatelessWidget {
  const EmptyChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: kThirdColor.withOpacity(.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 42,
                color: kThirdColor,
              ),
            ),

            SizedBox(height: 24),

            Text(
              "No Messages Yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? Colors.white
                    : Colors.black,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Start a conversation with a freelancer or client and grow your network.",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                color: isDark
                    ? Colors.white60
                    : Colors.black54,
              ),
            ),

            SizedBox(height: 28),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_comment_rounded),
              label: const Text("Start Chat"),
              style: ElevatedButton.styleFrom(
                backgroundColor: kThirdColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}