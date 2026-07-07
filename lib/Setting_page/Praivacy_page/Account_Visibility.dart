import 'package:flutter/material.dart';

class AccountVisibilityScreen extends StatefulWidget {
  const AccountVisibilityScreen({super.key});

  @override
  State<AccountVisibilityScreen> createState() =>
      _AccountVisibilityScreenState();
}

class _AccountVisibilityScreenState extends State<AccountVisibilityScreen> {

  bool isPublic = true;
  bool showEmail = true;
  bool showPhone = false;

  void toggleVisibility(bool value) {
    setState(() {
      isPublic = value;
    });
  }

  void toggleEmail(bool value) {
    setState(() {
      showEmail = value;
    });
  }

  void togglePhone(bool value) {
    setState(() {
      showPhone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Visibility"),
      ),
      body: Column(
        children: [

          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text("Account Visibility"),
            subtitle: Text(isPublic ? "Public" : "Private"),
            onTap: () {
              setState(() {
                isPublic = !isPublic;
              });
            },
          ),

          const Divider(),


          SwitchListTile(

              title: const Text("Show Email "),
              value: showEmail,
              onChanged:(value){
                setState(() {
                  showEmail = value;
                });
              }
          ),


          SwitchListTile(
            secondary: const Icon(Icons.phone),
            title: const Text("Show Phone Number"),
            value: showPhone,
            onChanged: togglePhone,
          ),
        ],
      ),
    );
  }
}
