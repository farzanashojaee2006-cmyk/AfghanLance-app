import 'package:flutter/material.dart';

class JobCategoryScreen extends StatefulWidget {
  const JobCategoryScreen({super.key});

  @override
  State<JobCategoryScreen> createState() => _JobCategoryScreenState();
}

class _JobCategoryScreenState extends State<JobCategoryScreen> {
  String selectedCategory = "Software Development";

  final List<String> categories = [
    "Software Development",
    "UI/UX Design",
    "Graphic Design",
    "Accounting",
    "Marketing",
    "Sales",
    "Customer Service",
    "Human Resources",
    "Education",
    "Healthcare",
    "Engineering",
    "Banking",
    "Administration",
    "Project Management",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Category"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return RadioListTile<String>(
            title: Text(categories[index]),
            value: categories[index],
            groupValue: selectedCategory,
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, selectedCategory);
          },
          child: const Text("Save"),
        ),
      ),
    );
  }
}