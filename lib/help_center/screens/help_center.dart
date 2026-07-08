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
      question: 'I forgot my password',
      answer: 'Tap "Forgot Password" on the login screen, enter your email address, and follow the instructions to reset your password.',
    ),

    FaqModel(
      question: "I can't sign in",
      answer: 'Check that your email and password are correct. If the problem continues, reset your password or contact support.',
    ),

    FaqModel(
      question: 'How do I edit my profile?',
      answer: 'Go to Profile, tap the Edit button, update your information, and save your changes.',
    ),

    FaqModel(
      question: 'How do I post a project?',
      answer: 'Open the Projects page, tap "Create Project", enter the project details, set your budget, and publish it.',
    ),

    FaqModel(
      question: 'How do I submit a proposal?',
      answer: 'Open a project, tap "Submit Proposal", write your proposal, set your bid, and send it to the client.',
    ),

    FaqModel(
      question: 'Report a bug',
      answer: 'If you find a bug, please contact our support team with a description of the issue and, if possible, include screenshots.',
    ),

    FaqModel(
      question: 'Contact Support',
      answer: 'You can contact our support team through Live Chat, Email Support, or the Contact Support form in the Help Center.',
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
          .where(
            (faq) => faq.question.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  Future<void> launchSupportEmail() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: 'support@yourapp.com',
      queryParameters: {'subject': 'Support Request'},
    );

    await launchUrl(email, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center'), centerTitle: true),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),
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

          const Text(
            'Support',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
