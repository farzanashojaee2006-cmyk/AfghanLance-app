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
        title: Text("Appearance"),
      ),

      body: ListView(
        children: [

          SwitchListTile(
            secondary: Icon(Icons.dark_mode),

            title: Text("Dark Mode"),

            subtitle:
            Text("Enable dark theme"),

            value: darkMode,

            onChanged: (value) {

              setState(() {
                darkMode = value;
              });

            },
          ),

          ListTile(
            leading: Icon(Icons.light_mode),

            title: Text("Light Theme"),

            subtitle:
            Text("Use light appearance"),

            trailing:
            Icon(Icons.arrow_forward_ios),

            onTap: () {},
          ),

          ListTile(
            leading:
            Icon(Icons.phone_android),

            title: Text("System Theme"),

            subtitle: Text(
                "Follow device settings"),

            trailing:
            Icon(Icons.arrow_forward_ios),

            onTap: () {},
          ),

          ListTile(
            leading:
            Icon(Icons.format_size),

            title: Text("Font Size"),

            subtitle: Text(fontSize),

            trailing:
            Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                fontSize = "Large";
              });

            },
          ),

          ListTile(
            leading:
            Icon(Icons.color_lens),

            title: Text("App Color"),

            subtitle: Text(appColor),

            trailing:
            Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                appColor = "Blue";
              });

            },
          ),

          ListTile(
            leading: Icon(Icons.language),

            title: Text("Language"),

            subtitle: Text(language),

            trailing:
            Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                language = "فارسی";
              });

            },
          ),

          SwitchListTile(
            secondary:
            Icon(Icons.animation),

            title: Text("Animations"),

            subtitle: Text(
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
            Icon(Icons.rounded_corner),

            title:
            Text("Rounded Corners"),

            subtitle: Text(
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
            Icon(Icons.photo_size_select_large),

            title: Text("Icon Size"),

            subtitle: Text(iconSize),

            trailing:
            Icon(Icons.arrow_forward_ios),

            onTap: () {

              setState(() {
                iconSize = "Large";
              });

            },
          ),
          ListTile(
            leading:
            Icon(Icons.preview),

            title:
            Text("Theme Preview"),

            subtitle: Text(
                "Preview app appearance"),

            trailing:
            Icon(Icons.arrow_forward_ios),

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
