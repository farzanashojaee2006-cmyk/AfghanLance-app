import 'package:flutter/material.dart';

class BirthYearScreen extends StatelessWidget {
  const BirthYearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Birth Year"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Update your birth year",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter birth year",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}