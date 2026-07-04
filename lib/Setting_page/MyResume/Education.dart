import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() =>
      _EducationScreenState();
}

class _EducationScreenState
    extends State<EducationScreen> {

  final TextEditingController schoolController =
  TextEditingController();

  final TextEditingController degreeController =
  TextEditingController();

  final TextEditingController fieldController =
  TextEditingController();

  final TextEditingController startYearController =
  TextEditingController();

  final TextEditingController endYearController =
  TextEditingController();

  final TextEditingController gradeController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: schoolController,
              decoration: const InputDecoration(
                labelText: "School / University Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: degreeController,
              decoration: const InputDecoration(
                labelText: "Degree",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: fieldController,
              decoration: const InputDecoration(
                labelText: "Field of Study",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: startYearController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Start Year",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: endYearController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "End Year",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: gradeController,
              decoration: const InputDecoration(
                labelText: "Grade / GPA (Optional)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Description (Optional)",
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
                        "Education Saved",
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