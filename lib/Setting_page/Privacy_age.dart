
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy"),
      ),

      body: ListView(
        children: [

          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Change Password"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.security),
            title: Text("Two-Step Verification"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.visibility),
            title: Text("Account Visibility"),
            subtitle: Text("Public"),
          ),

          ListTile(
            leading: Icon(Icons.email),
            title: Text("Show Email to Employers"),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),

          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Show Phone Number"),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),

          ListTile(
            leading: Icon(Icons.block),
            title: Text("Blocked Companies"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete Account"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.policy),
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.arrow_forward_ios),
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
