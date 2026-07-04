import 'package:flutter/material.dart';

class ResumeVisibilityScreen extends StatefulWidget {
  const ResumeVisibilityScreen({super.key});

  @override
  State<ResumeVisibilityScreen> createState() => _ResumeVisibilityScreenState();
}

class _ResumeVisibilityScreenState extends State<ResumeVisibilityScreen> {
  String selectedVisibility = "Public";

  void saveVisibility() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Visibility saved: $selectedVisibility"),
      ),
    );
  }

  Widget buildOption(String title, String subtitle) {
    return RadioListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: title,
      groupValue: selectedVisibility,
      onChanged: (value) {
        setState(() {
          selectedVisibility = value.toString();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Visibility"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildOption(
              "Public",
              "Anyone can view your resume",
            ),
            buildOption(
              "Private",
              "Only you can view your resume",
            ),
            buildOption(
              "Only Recruiters",
              "Only verified recruiters can see your resume",
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveVisibility,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}