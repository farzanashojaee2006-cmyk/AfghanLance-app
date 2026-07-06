import 'package:flutter/material.dart';

class ResumeAnalyticsScreen extends StatelessWidget {
  const ResumeAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    int views = 120;
    int applications = 8;
    int searchAppearances = 45;
    double profileStrength = 0.75;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Analytics"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.orange),
                title: const Text("Profile Strength"),
                subtitle: LinearProgressIndicator(value: profileStrength),
                trailing: Text("${(profileStrength * 100).toInt()}%"),
              ),
            ),

            const SizedBox(height: 10),


            Card(
              child: ListTile(
                leading: const Icon(Icons.visibility),
                title: const Text("Profile Views"),
                trailing: Text("$views"),
              ),
            ),


            Card(
              child: ListTile(
                leading: const Icon(Icons.send),
                title: const Text("Applications Sent"),
                trailing: Text("$applications"),
              ),
            ),


            Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: const Text("Search Appearances"),
                trailing: Text("$searchAppearances"),
              ),
            ),

            const SizedBox(height: 20),


            Card(
              color: Colors.blue.shade50,
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "💡 Tip: Add more skills and portfolio projects to increase your visibility.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
