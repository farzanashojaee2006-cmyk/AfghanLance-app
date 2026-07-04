
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/faq_model.dart';

import 'contact_support.dart';
import 'live_chat.dart';


class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {

  bool showFaq = false;

  final TextEditingController searchController = TextEditingController();

  late List<FaqModel> filteredFaqs;

  final List<FaqModel> faqs = [
    FaqModel(
      question: 'How do I create a project?',
      answer: 'Go to Projects page and tap Create Project.',
    ),
    FaqModel(
      question: 'How do I withdraw earnings?',
      answer: 'Open Wallet and select Withdraw.',
    ),
    FaqModel(
      question: 'How do I contact a client?',
      answer: 'Use the Messages section.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    filteredFaqs = faqs;
  }

  void searchFaq(String value) {
    setState(() {
      filteredFaqs = faqs
          .where((faq) =>
          faq.question.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  Future<void> launchSupportEmail() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: 'support@yourapp.com',
      queryParameters: {
        'subject': 'Support Request',
      },
    );

    await launchUrl(
      email,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // TITLE
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // SHOW / HIDE BUTTON
          TextButton(
            onPressed: () {
              setState(() {
                showFaq = !showFaq;
              });
            },
            child: Text(
              showFaq ? 'Hide Questions' : 'Show Questions',
              style: const TextStyle(color: Colors.black),
            ),
          ),

          const SizedBox(height: 10),

          // FAQ LIST
          if (showFaq)
            ...filteredFaqs.map((faq) {
              return ExpansionTile(
                title: Text(faq.question),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(faq.answer),
                  ),
                ],
              );
            }).toList(),

          const SizedBox(height: 20),

          // SUPPORT SECTION
          const Text(
            'Support',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [

                ListTile(
                  leading: const Icon(Icons.support_agent),
                  title: const Text('Contact Support'),
                  subtitle: const Text('Get help from our team'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactSupportScreen(),
                      ),
                    );
                  },
                ),

                Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline),
                  title: const Text('Live Chat'),
                  subtitle: const Text('Chat with support'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LiveChatScreen(),
                      ),
                    );
                  },
                ),
                Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email Support'),
                  subtitle: const Text('support@yourapp.com'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: launchSupportEmail,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}



