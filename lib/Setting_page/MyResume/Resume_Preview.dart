import 'package:flutter/material.dart';

class ResumePreviewScreen extends StatelessWidget {
  const ResumePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Preview"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Zainab Mohammadi",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(Icons.email),
              title: Text("zainab@gmail.com"),
            ),

            const ListTile(
              leading: Icon(Icons.phone),
              title: Text("+93xxxxxxxxx"),
            ),

            const Divider(),

            const Text(
              "Professional Summary",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Flutter Developer and Job Seeker",
            ),

            SizedBox(height: 20),

            Text(
              "Work Experience",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.work),
              title: Text("Junior Flutter Developer"),
              subtitle: Text("ABC Company (2024 - 2025)"),
            ),

            Divider(),

            Text(
              "Education",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.school),
              title: Text("Computer Science"),
              subtitle: Text("Balkh University"),
            ),

            Divider(),

            Text(
              "Skills",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Wrap(
              spacing: 8,
              children: const [
                Chip(label: Text("Flutter")),
                Chip(label: Text("Dart")),
                Chip(label: Text("Firebase")),
                Chip(label: Text("UI Design")),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "Languages",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.language),
              title: Text("Dari, English"),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit),
                label: Text("Edit Resume"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}