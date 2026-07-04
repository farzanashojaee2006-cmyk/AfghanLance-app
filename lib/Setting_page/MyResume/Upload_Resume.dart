import 'package:flutter/material.dart';

class UploadResumeScreen extends StatefulWidget {
  const UploadResumeScreen({super.key});

  @override
  State<UploadResumeScreen> createState() =>
      _UploadResumeScreenState();
}

class _UploadResumeScreenState
    extends State<UploadResumeScreen> {

  String fileName = "No file selected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Resume"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Icon(
              Icons.upload_file,
              size: 100,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            Text(
              fileName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    fileName = "Resume.pdf";
                  });
                },
                child: const Text(
                  "Choose Resume",
                ),
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
                        "Resume Uploaded Successfully",
                      ),
                    ),
                  );
                },
                child: const Text("Upload"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}