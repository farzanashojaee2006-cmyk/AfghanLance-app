import 'package:flutter/material.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String selectedLanguage = "English";

  final List<String> languages = [
    "English",
    "Dari",
    "Pashto",
    "Arabic",
    "Persian",
    "Urdu",
    "Hindi",
    "Turkish",
    "German",
    "French",
    "Chinese",
    "Russian",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Languages for Work"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return RadioListTile<String>(
            title: Text(languages[index]),
            value: languages[index],
            groupValue: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value!;
              });
            },
          );
        },
      ),
    );
  }
}