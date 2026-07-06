import 'package:flutter/material.dart';

class FlutterDeveloperPage extends StatelessWidget {
  const FlutterDeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Developer"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Flutter Developer",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const ListTile(
              leading: Icon(Icons.business, color: Colors.blue),
              title: Text("Google"),
            ),

            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text("Kabul, Afghanistan"),
            ),

            const ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text("\$1200 / month"),
            ),

            const ListTile(
              leading: Icon(Icons.work, color: Colors.orange),
              title: Text("Full Time"),
            ),

            const ListTile(
              leading: Icon(Icons.star, color: Colors.amber),
              title: Text("Experience: 2+ Years"),
            ),

            const Divider(),

            const Text(
              "Job Description",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "We are looking for a Flutter Developer to build high quality mobile applications. "
                  "The candidate should have experience with Flutter, Dart, Firebase and REST APIs.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Required Skills",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                Chip(label: Text("Flutter")),
                Chip(label: Text("Dart")),
                Chip(label: Text("Firebase")),
                Chip(label: Text("REST API")),
                Chip(label: Text("Git")),
                Chip(label: Text("SQLite")),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Benefits",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Health Insurance"),
            ),

            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Remote Work"),
            ),

            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Annual Bonus"),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Apply Now"),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark),
                    label: const Text("Save"),
                  ),
                ),

                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text("Share"),
                  ),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
