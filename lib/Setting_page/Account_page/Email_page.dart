import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  final TextEditingController emailController =
  TextEditingController();

  get SharedPreferences => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Email helps us verify your account",
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
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
                  await SharedPreferences.getInstance();

                  await prefs.setString(
                    'email',
                    emailController.text,
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