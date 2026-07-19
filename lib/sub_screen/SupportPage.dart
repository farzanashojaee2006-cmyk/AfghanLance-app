import 'package:afghanlance/constants.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  static const String id = "/supportPage";

  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kDarkBackgroundColor : const Color(0xFFF7FAFA),

      appBar: AppBar(
        title: const Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kThirdColor, kSecondColor],

                  begin: Alignment.topLeft,

                  end: Alignment.bottomRight,
                ),

                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.support_agent,

                      color: Colors.white,

                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "Need Support?",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 25,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Our support team is here to help you anytime.",

                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),

                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Contact Us",

              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            supportCard(
              context,

              Icons.email_outlined,

              "Email Support",

              "support@yourapp.com",
            ),

            const SizedBox(height: 15),

            supportCard(
              context,

              Icons.phone_outlined,

              "Phone Support",

              "+93 700 000 000",
            ),

            const SizedBox(height: 15),

            supportCard(
              context,

              Icons.chat_bubble_outline,

              "Live Chat",

              "Available 24/7",
            ),
          ],
        ),
      ),
    );
  }

  Widget supportCard(
    BuildContext context,

    IconData icon,

    String title,

    String subtitle,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: isDark ? kDarkSurfaceColor : Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),

            blurRadius: 15,

            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            height: 52,

            width: 52,

            decoration: BoxDecoration(
              color: kSecondColor.withOpacity(0.15),

              shape: BoxShape.circle,
            ),

            child: Icon(icon, color: kThirdColor, size: 27),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                    fontSize: 16,

                    color: isDark ? Colors.white : k4Color,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,

                  style: TextStyle(
                    fontSize: 13,

                    color: isDark ? Colors.white60 : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
