import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      appBar: AppBar(
        title: const Text("Support"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Need Support?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Our support team is here to help you anytime.",
            ),

            const SizedBox(height: 30),

            supportCard(
              Icons.email,
              "Email Support",
              "support@yourapp.com",
            ),

            const SizedBox(height: 15),

            supportCard(
              Icons.phone,
              "Phone Support",
              "+93 700 000 000",
            ),

            const SizedBox(height: 15),

            supportCard(
              Icons.chat,
              "Live Chat",
              "Available 24/7",
            ),
          ],
        ),
      ),
    );
  }

  Widget supportCard(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            child: Icon(icon),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 5),

              Text(subtitle),
            ],
          )
        ],
      ),
    );
  }
}


