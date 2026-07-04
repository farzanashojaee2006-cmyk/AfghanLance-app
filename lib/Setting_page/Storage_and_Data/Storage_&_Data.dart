import 'package:flutter/material.dart';

class StorageDataPage extends StatefulWidget {
  const StorageDataPage({super.key});

  @override
  State<StorageDataPage> createState() =>
      _StorageDataPageState();
}

class _StorageDataPageState
    extends State<StorageDataPage> {

  bool autoDownload = true;
  bool saveDataMode = false;

  String uploadQuality = "High";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Storage & Data"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: [

          const SizedBox(height: 10),

          ListTile(

            leading:
            const Icon(Icons.cleaning_services),

            title: const Text("Clear Cache"),

            subtitle: const Text(
              "Remove temporary files",
            ),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content: Text("Cache Cleared"),
                ),

              );

            },
          ),

          const Divider(),

          ListTile(

            leading:
            const Icon(Icons.delete_outline),

            title:
            const Text("Clear Downloaded Files"),

            subtitle: const Text(
              "Delete saved resumes and PDFs",
            ),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content:
                  Text("Downloaded Files Deleted"),
                ),

              );

            },
          ),

          const Divider(),

          ListTile(

            leading:
            const Icon(Icons.data_usage),

            title: const Text("Data Usage"),

            subtitle:
            const Text("WiFi & Mobile Data"),

            trailing: const Text("120 MB"),
          ),

          const Divider(),

          SwitchListTile(

            secondary:
            const Icon(Icons.download),

            title:
            const Text("Auto Download Resume"),

            subtitle: const Text(
              "Download files automatically",
            ),

            value: autoDownload,

            onChanged: (value) {

              setState(() {
                autoDownload = value;
              });

            },
          ),

          const Divider(),

          SwitchListTile(

            secondary:
            const Icon(Icons.savings),

            title:
            const Text("Save Data Mode"),

            subtitle: const Text(
              "Reduce internet usage",
            ),

            value: saveDataMode,

            onChanged: (value) {

              setState(() {
                saveDataMode = value;
              });

            },
          ),

          const Divider(),

          ListTile(

            leading:
            const Icon(Icons.storage),

            title: const Text("Storage Used"),

            subtitle:
            const Text("Used Storage: 120 MB"),
          ),

          const Divider(),

          ListTile(

            leading:
            const Icon(Icons.high_quality),

            title:
            const Text("Upload Quality"),

            subtitle: Text(uploadQuality),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                uploadQuality = "Medium";
              });

            },
          ),

          const Divider(),

          ListTile(

            leading:
            const Icon(Icons.backup),

            title: const Text("Backup Data"),

            subtitle: const Text(
              "Save account data",
            ),
            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content: Text("Backup Completed"),
                ),

              );

            },
          ),

          const Divider(),

          ListTile(

            leading:
            const Icon(Icons.restore),

            title: const Text("Restore Data"),

            subtitle: const Text(
              "Restore saved data",
            ),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content: Text("Data Restored"),
                ),

              );

            },
          ),

          const Divider(),

          ListTile(

            leading:
            const Icon(Icons.delete_forever),

            title:
            const Text("Delete Account Data"),

            subtitle: const Text(
              "Remove all account information",
            ),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content:
                  Text("Account Data Deleted"),
                ),

              );

            },
          ),

        ],
      ),
    );
  }
}