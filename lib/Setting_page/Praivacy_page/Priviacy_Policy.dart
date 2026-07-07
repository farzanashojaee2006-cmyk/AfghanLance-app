import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Text(
            '''
Privacy Policy

We respect your privacy and are committed to protecting your personal information.

1. Information We Collect
- Name
- Email Address
- Phone Number
- Resume Information

2. How We Use Your Information
- To create your profile
- To help employers find you
- To improve our services

3. Data Security
We take reasonable measures to protect your personal data.

4. Sharing Information
We do not sell your personal information to third parties.

5. Your Rights
You can update or delete your account information at any time.

6. Contact Us
If you have any questions regarding this Privacy Policy, please contact support.

Last Updated: 2026
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}