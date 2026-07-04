import 'package:flutter/material.dart';

class ShowPhoneNumberScreen extends StatefulWidget {
  const ShowPhoneNumberScreen({super.key});

  @override
  State<ShowPhoneNumberScreen> createState() =>
      _ShowPhoneNumberScreenState();
}

class _ShowPhoneNumberScreenState
    extends State<ShowPhoneNumberScreen> {

  bool showPhone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Phone Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SwitchListTile(
          title: const Text("Show Phone Number"),
          subtitle: const Text(
            "Allow employers to see your phone number",
          ),
          value: showPhone,
          onChanged: (value) {
            setState(() {
              showPhone = value;
            });
          },
        ),
      ),
    );
  }
}