import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6F8),

      appBar: AppBar(
        title: Text("Help"),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: const [

          HelpTile(
            title: "How to create an account?",
            subtitle:
            "Go to signup page and fill all required information.",
          ),

          HelpTile(
            title: "How to reset password?",
            subtitle:
            "Use the forgot password button on login page.",
          ),

          HelpTile(
            title: "How to contact support?",
            subtitle:
            "Open support page and contact our team.",
          ),

          HelpTile(
            title: "How to update profile?",
            subtitle:
            "Go to profile settings and edit your information.",
          ),
        ],
      ),
    );
  }
}

class HelpTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const HelpTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: ExpansionTile(
        leading: Icon(Icons.help_outline),
        title: Text(title),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(subtitle),
          )
        ],
      ),
    );
  }
}




