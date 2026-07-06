import 'package:flutter/material.dart';

class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({super.key});

  @override
  State<WorkExperienceScreen> createState() =>
      _WorkExperienceScreenState();
}

class _WorkExperienceScreenState
    extends State<WorkExperienceScreen> {

  final TextEditingController jobTitleController =
  TextEditingController();

  final TextEditingController companyController =
  TextEditingController();

  final TextEditingController locationController =
  TextEditingController();

  final TextEditingController startDateController =
  TextEditingController();

  final TextEditingController endDateController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Experience"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: jobTitleController,
              decoration: const InputDecoration(
                labelText: "Job Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: companyController,
              decoration: const InputDecoration(
                labelText: "Company Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: "Location",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: startDateController,
              decoration: const InputDecoration(
                labelText: "Start Date",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: endDateController,
              decoration: const InputDecoration(
                labelText: "End Date",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Job Description",
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
                        "Work Experience Saved",
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