
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
      ),

      body: ListView(
        children: [

          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.security),
            title: const Text("Two-Step Verification"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text("Account Visibility"),
            subtitle: const Text("Public"),
          ),

          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("Show Email to Employers"),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),

          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Show Phone Number"),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),

          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("Blocked Companies"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete Account"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {

              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration:
                  Duration(milliseconds: 500),

                  pageBuilder: (_, __, ___)=>
                      PrivacyPage(),

                  transitionsBuilder: (_, animation,
                      __, child){
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1,0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },

                ),

              );
            },
          ),

        ],
      ),
    );
  }
}
