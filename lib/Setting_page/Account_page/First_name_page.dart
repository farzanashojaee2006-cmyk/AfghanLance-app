import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstNameScreen extends StatefulWidget {
  const FirstNameScreen({super.key});

  @override
  State<FirstNameScreen> createState() =>
      _FirstNameScreenState();
}
class _FirstNameScreenState extends
State<FirstNameScreen> {

  final TextEditingController
  firstNameController =
  TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Update your first name",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                hintText: "Enter first name",
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
                onPressed: () async {
                  final prefs =
                  await
                  SharedPreferences.getInstance();

                  await prefs.setString(
                    'firstName',
                    firstNameController.text,
                  );
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