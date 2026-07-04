import 'package:flutter/material.dart';

class PreferredCompanySizeScreen extends StatefulWidget {
  const PreferredCompanySizeScreen({super.key});

  @override
  State<PreferredCompanySizeScreen> createState() =>
      _PreferredCompanySizeScreenState();
}

class _PreferredCompanySizeScreenState
    extends State<PreferredCompanySizeScreen> {

  String selectedSize = "Startup (1-50 Employees)";

  final List<String> companySizes = [
    "Startup (1-50 Employees)",
    "Small (51-200 Employees)",
    "Medium (201-1000 Employees)",
    "Large (1000+ Employees)",
    "No Preference",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferred Company Size"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: companySizes.length,
        itemBuilder: (context, index) {
          return RadioListTile<String>(
            title: Text(companySizes[index]),
            value: companySizes[index],
            groupValue: selectedSize,
            onChanged: (value) {
              setState(() {
                selectedSize = value!;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          Navigator.pop(context, selectedSize);
        },
      ),
    );
  }
}