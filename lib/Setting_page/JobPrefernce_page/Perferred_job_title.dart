import 'package:flutter/material.dart';

class PreferencesJobScreen extends StatefulWidget {
  const PreferencesJobScreen({super.key});

  @override
  State<PreferencesJobScreen> createState() => _JobPreferencesScreenState();
}

class _JobPreferencesScreenState extends State<PreferencesJobScreen> {
  final TextEditingController jobTitleController = TextEditingController();

  List<String> jobTitles = [];

  void addJobTitle() {
    if (jobTitleController.text.isEmpty) return;

    setState(() {
      jobTitles.add(jobTitleController.text);
    });

    jobTitleController.clear();
  }

  void deleteJobTitle(int index) {
    setState(() {
      jobTitles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Preferences"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: jobTitleController,
              decoration: const InputDecoration(
                labelText: "Preferred Job Title",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addJobTitle,
                child: const Text("Add Job Title"),
              ),
            ),

            const SizedBox(height: 20),


            Expanded(
              child: ListView.builder(
                itemCount: jobTitles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.badge),
                      title: Text(jobTitles[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteJobTitle(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
