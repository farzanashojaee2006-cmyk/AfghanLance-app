import 'package:flutter/material.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  final TextEditingController languageController = TextEditingController();

  String selectedLevel = "Beginner";

  List<Map<String, String>> languages = [];

  void addLanguage() {
    if (languageController.text.isEmpty) return;

    setState(() {
      languages.add({
        "name": languageController.text,
        "level": selectedLevel,
      });
    });

    languageController.clear();
  }

  void deleteLanguage(int index) {
    setState(() {
      languages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Languages"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: languageController,
              decoration: const InputDecoration(
                labelText: "Language Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedLevel,
              items: const [
                DropdownMenuItem(value: "Beginner", child: Text("Beginner")),
                DropdownMenuItem(value: "Intermediate", child: Text("Intermediate")),
                DropdownMenuItem(value: "Advanced", child: Text("Advanced")),
                DropdownMenuItem(value: "Fluent", child: Text("Fluent")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedLevel = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Level",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addLanguage,
                child: const Text("Add Language"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(lang["name"] ?? ""),
                      subtitle: Text(lang["level"] ?? ""),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteLanguage(index),
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