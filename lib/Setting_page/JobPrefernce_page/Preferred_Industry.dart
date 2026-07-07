import 'package:flutter/material.dart';

class PreferredIndustry {
  final String id;
  final String title;

  PreferredIndustry({
    required this.id,
    required this.title,
  });
}

class PreferredIndustryPage extends StatefulWidget {
  const PreferredIndustryPage({super.key});

  @override
  State<PreferredIndustryPage> createState() => _PreferredIndustryPageState();
}

class _PreferredIndustryPageState extends State<PreferredIndustryPage> {
  PreferredIndustry? selectedIndustry;

  List<PreferredIndustry> preferredIndustries = [
    PreferredIndustry(id: "it", title: "Information Technology"),
    PreferredIndustry(id: "software", title: "Software Development"),
    PreferredIndustry(id: "finance", title: "Finance & Banking"),
    PreferredIndustry(id: "education", title: "Education"),
    PreferredIndustry(id: "health", title: "Healthcare"),
    PreferredIndustry(id: "engineering", title: "Engineering"),
    PreferredIndustry(id: "construction", title: "Construction"),
    PreferredIndustry(id: "marketing", title: "Marketing & Sales"),
    PreferredIndustry(id: "retail", title: "Retail & Wholesale"),
    PreferredIndustry(id: "transport", title: "Transport & Logistics"),
    PreferredIndustry(id: "hr", title: "Human Resources"),
    PreferredIndustry(id: "media", title: "Media & Creative"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferred Industry"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<PreferredIndustry>(
          value: selectedIndustry,
          isExpanded: true,
          hint: const Text("Select your preferred industry"),
          items: preferredIndustries.map((industry) {
            return DropdownMenuItem(
              value: industry,
              child: Text(industry.title),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedIndustry = value;
            });
          },
        ),
      ),
    );
  }
}
