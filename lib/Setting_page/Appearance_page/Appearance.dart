import 'package:flutter/material.dart';

class AppearancePage extends StatefulWidget{
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() =>
      _AppearancePageState();
}

class _AppearancePageState
    extends State<AppearancePage> {

  bool darkMode = true;
  bool animations = true;
  bool roundedCorners = true;

  String fontSize = "Medium";
  String appColor = "Teal";
  String language = "English";
  String iconSize = "Medium";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Appearance"),
      ),

      body: ListView(
        children: [

          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),

            title: const Text("Dark Mode"),

            subtitle:
            const Text("Enable dark theme"),

            value: darkMode,

            onChanged: (value) {

              setState(() {
                darkMode = value;
              });

            },
          ),

          ListTile(
            leading: const Icon(Icons.light_mode),

            title: const Text("Light Theme"),

            subtitle:
            const Text("Use light appearance"),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {},
          ),

          ListTile(
            leading:
            const Icon(Icons.phone_android),

            title: const Text("System Theme"),

            subtitle: const Text(
                "Follow device settings"),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {},
          ),

          ListTile(
            leading:
            const Icon(Icons.format_size),

            title: const Text("Font Size"),

            subtitle: Text(fontSize),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                fontSize = "Large";
              });

            },
          ),

          ListTile(
            leading:
            const Icon(Icons.color_lens),

            title: const Text("App Color"),

            subtitle: Text(appColor),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                appColor = "Blue";
              });

            },
          ),

          ListTile(
            leading: const Icon(Icons.language),

            title: const Text("Language"),

            subtitle: Text(language),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                language = "فارسی";
              });

            },
          ),

          SwitchListTile(
            secondary:
            const Icon(Icons.animation),

            title: const Text("Animations"),

            subtitle: const Text(
                "Enable app animations"),

            value: animations,

            onChanged: (value) {

              setState(() {
                animations = value;
              });

            },
          ),

          SwitchListTile(
            secondary:
            const Icon(Icons.rounded_corner),

            title:
            const Text("Rounded Corners"),

            subtitle: const Text(
                "Use smooth UI corners"),

            value: roundedCorners,

            onChanged: (value) {

              setState(() {
                roundedCorners = value;
              });

            },
          ),

          ListTile(
            leading:
            const Icon(Icons.photo_size_select_large),

            title: const Text("Icon Size"),

            subtitle: Text(iconSize),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                iconSize = "Large";
              });

            },
          ),
          ListTile(
            leading:
            const Icon(Icons.preview),

            title:
            const Text("Theme Preview"),

            subtitle: const Text(
                "Preview app appearance"),

            trailing:
            const Icon(Icons.arrow_forward_ios),

            onTap: () {

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content:
                  Text("Theme Preview Opened"),
                ),
              );

            },
          ),

        ],
      ),
    );
  }
}