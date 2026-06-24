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
        title: Text("Storage & Data"),
      ),

      body: ListView(

        padding: EdgeInsets.all(16),

        children: [

          SizedBox(height: 10),

          ListTile(

            leading:
            Icon(Icons.cleaning_services),

            title: Text("Clear Cache"),

            subtitle: Text(
              "Remove temporary files",
            ),

            trailing:
            Icon(Icons.arrow_forward_ios),

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
            Icon(Icons.delete_outline),

            title:
            Text("Clear Downloaded Files"),

            subtitle: Text(
              "Delete saved resumes and PDFs",
            ),

            trailing:
            Icon(Icons.arrow_forward_ios),

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
            Icon(Icons.data_usage),

            title: Text("Data Usage"),

            subtitle:
            Text("WiFi & Mobile Data"),

            trailing: Text("120 MB"),
          ),

          const Divider(),

          SwitchListTile(

            secondary:
            Icon(Icons.download),

            title:
            Text("Auto Download Resume"),

            subtitle: Text(
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
            Icon(Icons.savings),

            title:
            Text("Save Data Mode"),

            subtitle: Text(
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
            Icon(Icons.storage),

            title: Text("Storage Used"),

            subtitle:
            Text("Used Storage: 120 MB"),
          ),

          const Divider(),

          ListTile(

            leading:
            Icon(Icons.high_quality),

            title:
            Text("Upload Quality"),

            subtitle: Text(uploadQuality),

            trailing:
            Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                uploadQuality = "Medium";
              });

            },
          ),

          const Divider(),

          ListTile(

            leading:
            Icon(Icons.backup),

            title: Text("Backup Data"),

            subtitle: Text(
              "Save account data",
            ),
            trailing:
            Icon(Icons.arrow_forward_ios),

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
            Icon(Icons.restore),

            title: Text("Restore Data"),

            subtitle: Text(
              "Restore saved data",
            ),

            trailing:
            Icon(Icons.arrow_forward_ios),

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
            Icon(Icons.delete_forever),

            title:
            Text("Delete Account Data"),

            subtitle: Text(
              "Remove all account information",
            ),

            trailing:
            Icon(Icons.arrow_forward_ios),

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
