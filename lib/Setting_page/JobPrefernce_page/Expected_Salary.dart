import 'package:flutter/material.dart';

class ExpectedSalaryScreen extends StatefulWidget {
  const ExpectedSalaryScreen({super.key});

  @override
  State<ExpectedSalaryScreen> createState() =>
      _ExpectedSalaryScreenState();
}

class _ExpectedSalaryScreenState
    extends State<ExpectedSalaryScreen> {

  String selectedSalary = "\$500 - \$1000";

  final List<String> salaryList = [
    "\$100 - \$300",
    "\$300 - \$500",
    "\$500 - \$1000",
    "\$1000 - \$1500",
    "\$1500 - \$2000",
    "\$2000+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expected Salary"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: salaryList.length,
        itemBuilder: (context, index) {

          return RadioListTile<String>(
            title: Text(salaryList[index]),
            value: salaryList[index],
            groupValue: selectedSalary,
            onChanged: (value) {
              setState(() {
                selectedSalary = value!;
              });
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          Navigator.pop(context, selectedSalary);
        },
      ),
    );
  }
}