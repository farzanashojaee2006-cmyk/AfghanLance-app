import 'package:flutter/material.dart';

class WorkSchedule {
  final String id;
  final String title;

  WorkSchedule({
    required this.id,
    required this.title,
  });
}

class WorkSchedulePage extends StatefulWidget {
  const WorkSchedulePage({super.key});

  @override
  State<WorkSchedulePage> createState() => _WorkSchedulePageState();
}

class _WorkSchedulePageState extends State<WorkSchedulePage> {

  WorkSchedule? selectedSchedule;

  List<WorkSchedule> schedules = [
    WorkSchedule(id: "full", title: "Full-time"),
    WorkSchedule(id: "part", title: "Part-time"),
    WorkSchedule(id: "remote", title: "Remote"),
    WorkSchedule(id: "onsite", title: "On-site"),
    WorkSchedule(id: "hybrid", title: "Hybrid"),
    WorkSchedule(id: "freelance", title: "Freelance"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Schedule"),
      ),
      body: ListView(
        children: schedules.map((item) {
          return ListTile(
            title: Text(item.title),

            trailing: selectedSchedule?.id == item.id
                ? const Icon(Icons.check, color: Colors.green)
                : null,

            onTap: () {
              setState(() {
                selectedSchedule = item;
              });

              Navigator.pop(context, selectedSchedule);
            },
          );
        }).toList(),
      ),
    );
  }
}
