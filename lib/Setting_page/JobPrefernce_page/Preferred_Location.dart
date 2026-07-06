import 'package:flutter/material.dart';

class PreferredLocationScreen extends StatefulWidget {
  const PreferredLocationScreen({super.key});

  @override
  State<PreferredLocationScreen> createState() =>
      _PreferredLocationScreenState();
}

class _PreferredLocationScreenState
    extends State<PreferredLocationScreen> {

  String selectedLocation = "Kabul";

  final List<String> locations = [
    "Kabul",
    "Herat",
    "Mazar-e-Sharif",
    "Kandahar",
    "Jalalabad",
    "Kunduz",
    "Bamyan",
    "Ghazni",
    "Parwan",
    "Takhar",
    "Badakhshan",
    "Samangan",
    "Baghlan",
    "Helmand",
    "Nangarhar",
    "Remote",
    "Anywhere",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferred Location"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return RadioListTile<String>(
            title: Text(locations[index]),
            value: locations[index],
            groupValue: selectedLocation,
            onChanged: (value) {
              setState(() {
                selectedLocation = value!;
              });
            },
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, selectedLocation);
            },
            child: const Text("Save"),
          ),
        ),
      ),
    );
  }
}