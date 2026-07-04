import 'package:flutter/material.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() =>
      _CertificationScreenState();
}

class _CertificationScreenState
    extends State<CertificationScreen> {

  final TextEditingController certificateController =
  TextEditingController();

  final TextEditingController organizationController =
  TextEditingController();

  final TextEditingController issueDateController =
  TextEditingController();

  final TextEditingController expiryDateController =
  TextEditingController();

  final TextEditingController certificateIdController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Certification"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: certificateController,
              decoration: const InputDecoration(
                labelText: "Certificate Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: organizationController,
              decoration: const InputDecoration(
                labelText: "Organization",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: issueDateController,
              decoration: const InputDecoration(
                labelText: "Issue Date",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: expiryDateController,
              decoration: const InputDecoration(
                labelText: "Expiry Date (Optional)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: certificateIdController,
              decoration: const InputDecoration(
                labelText: "Certificate ID (Optional)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Certification Saved",
                      ),
                    ),
                  );
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