import 'package:flutter/material.dart';

class JobAlertFrequency {
  final String id;
  final String title;

  JobAlertFrequency({
    required this.id,
    required this.title,
  });
}

class JobAlertPage extends StatefulWidget {
  const JobAlertPage({super.key});

  @override
  State<JobAlertPage> createState() => _JobAlertPageState();
}

class _JobAlertPageState extends State<JobAlertPage> {

  JobAlertFrequency? selected;

  List<JobAlertFrequency> options = [
    JobAlertFrequency(id: "instant", title: "Instant"),
    JobAlertFrequency(id: "daily", title: "Daily"),
    JobAlertFrequency(id: "weekly", title: "Weekly"),
    JobAlertFrequency(id: "never", title: "Never"),
  ];

  void openSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: options.map((item) {
            return ListTile(
              title: Text(item.title),

              trailing: selected?.id == item.id
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,

              onTap: () {
                setState(() {
                  selected = item;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Alert Frequency"),
      ),
      body: ListTile(
        title: const Text("Job Alert Frequency"),
        subtitle: Text(
          selected?.title ?? "Tap to select",
        ),
        trailing: const Icon(Icons.arrow_forward),

        onTap: openSheet,
      ),
    );
  }
}