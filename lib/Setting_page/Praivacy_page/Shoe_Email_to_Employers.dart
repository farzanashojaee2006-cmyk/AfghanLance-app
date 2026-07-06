import 'package:flutter/material.dart';

class ShowEmailToEmployersScreen extends StatefulWidget {
  const ShowEmailToEmployersScreen({super.key});

  @override
  State<ShowEmailToEmployersScreen> createState() =>
      _ShowEmailToEmployersScreenState();
}

class _ShowEmailToEmployersScreenState
    extends State<ShowEmailToEmployersScreen> {

  bool showEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Email To Employers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SwitchListTile(
          title: const Text("Show Email"),
          subtitle: const Text(
            "Allow employers to see your email",
          ),
          value: showEmail,
          onChanged: (value) {
            setState(() {
              showEmail = value;
            });
          },
        ),
      ),
    );
  }
}