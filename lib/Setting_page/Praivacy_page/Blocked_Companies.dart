import 'package:flutter/material.dart';

class BlockedCompaniesScreen extends StatefulWidget {
  const BlockedCompaniesScreen({super.key});

  @override
  State<BlockedCompaniesScreen> createState() =>
      _BlockedCompaniesScreenState();
}

class _BlockedCompaniesScreenState
    extends State<BlockedCompaniesScreen> {

  final List<String> blockedCompanies = [
    "ABC Company",
    "Google",
    "Microsoft",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blocked Companies"),
      ),
      body: blockedCompanies.isEmpty
          ? const Center(
        child: Text("No blocked companies"),
      )
          : ListView.builder(
        itemCount: blockedCompanies.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.block),
            title: Text(blockedCompanies[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  blockedCompanies.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            blockedCompanies.add(
              "New Company ${blockedCompanies.length + 1}",
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
