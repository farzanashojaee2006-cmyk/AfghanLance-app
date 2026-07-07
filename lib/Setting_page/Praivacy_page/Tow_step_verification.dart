import 'package:flutter/material.dart';

class TwoStepVerificationScreen extends StatefulWidget {
  const TwoStepVerificationScreen({super.key});

  @override
  State<TwoStepVerificationScreen> createState() =>
      _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState
    extends State<TwoStepVerificationScreen> {

  bool isEnabled = false;
  String verificationMethod = "SMS";

  final TextEditingController codeController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Two-Step Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text("Enable Two-Step Verification"),
              value: isEnabled,
              onChanged: (value) {
                setState(() {
                  isEnabled = value;
                });
              },
            ),
            const Text(
              "Add an extra layer of security to your account.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text(
                "Enable Two-Step Verification",
              ),
              value: isEnabled,
              onChanged: (value) {
                setState(() {
                  isEnabled = value;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Verification Method",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile(
              title: const Text("SMS"),
              value: "SMS",
              groupValue: verificationMethod,
              onChanged: (value) {
                setState(() {
                  verificationMethod = value!;
                });
              },
            ),

            RadioListTile(
              title: const Text("Email"),
              value: "Email",
              groupValue: verificationMethod,
              onChanged: (value) {
                setState(() {
                  verificationMethod = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Verification Code",
                hintText: "Enter 6-digit code",
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                        "Code sent via $verificationMethod",
                      ),
                    ),
                  );
                },
                child: const Text("Send Code"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Settings Saved",
                      ),
                    ),
                  );
                },
                child: const Text("Save Settings"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}