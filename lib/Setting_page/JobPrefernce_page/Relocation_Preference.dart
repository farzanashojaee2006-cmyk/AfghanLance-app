import 'package:flutter/material.dart';

class RelocationPreference {
  final String id;
  final String title;

  RelocationPreference({
    required this.id,
    required this.title,
  });
}

class RelocationPage extends StatefulWidget {
  const RelocationPage({super.key});

  @override
  State<RelocationPage> createState() => _RelocationPageState();
}

class _RelocationPageState extends State<RelocationPage> {

  RelocationPreference? selected;

  List<RelocationPreference> options = [
    RelocationPreference(id: "open", title: "Open to Relocate"),
    RelocationPreference(id: "not_open", title: "Not Open to Relocate"),
    RelocationPreference(id: "country", title: "Country Only"),
    RelocationPreference(id: "city", title: "City Only"),
    RelocationPreference(id: "remote", title: "Remote Only"),
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
        title: const Text("Relocation Preferences"),
      ),
      body: ListTile(
        title: const Text("Relocation Preference"),
        subtitle: Text(
          selected?.title ?? "Tap to select",
        ),
        trailing: const Icon(Icons.arrow_forward),

        onTap: openSheet,
      ),
    );
  }
}
