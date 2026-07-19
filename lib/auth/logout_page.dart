import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main_screens/welcome_page.dart';

class LogoutPage {
  static Future<void> showLogoutDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text(
            "Are you sure you want to logout?",
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },

              child: const Text("Cancel"),
            ),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),

              onPressed: () {
                Navigator.pop(context, true);
              },

              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),

          ],
        );
      },
    );


    if (result == true) {

      await FirebaseAuth.instance.signOut();


      Navigator.pushAndRemoveUntil(
        context,

        MaterialPageRoute(
          builder: (_) => WelcomePageOne(
            onToggleTheme: () {},
          ),
        ),

            (route) => false,
      );

    }
  }
}