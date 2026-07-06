import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController techController = TextEditingController();

  List<Map<String, String>> projects = [];

  void addProject() {
    if (nameController.text.isEmpty) return;

    setState(() {
      projects.add({
        "name": nameController.text,
        "desc": descController.text,
        "link": linkController.text,
        "tech": techController.text,
      });
    });

    nameController.clear();
    descController.clear();
    linkController.clear();
    techController.clear();
  }

  void deleteProject(int index) {
    setState(() {
      projects.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio Projects"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Project Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: linkController,
              decoration: const InputDecoration(
                labelText: "Project Link",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: techController,
              decoration: const InputDecoration(
                labelText: "Technologies (e.g. Flutter, Firebase)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addProject,
                child: const Text("Add Project"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final p = projects[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.work),
                      title: Text(p["name"] ?? ""),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p["desc"] ?? ""),
                          Text("Tech: ${p["tech"] ?? ""}"),
                          Text("Link: ${p["link"] ?? ""}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteProject(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}