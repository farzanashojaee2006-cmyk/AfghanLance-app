import 'package:flutter/material.dart';

import 'Account_Visibility.dart';
import 'Blocked_Companies.dart';
import 'Change_password.dart';
import 'Delete_Account.dart';
import 'Priviacy_Policy.dart';
import 'Shoe_Email_to_Employers.dart';
import 'Show_phon_Number.dart';
import 'Tow_step_verification.dart';

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const
                ChangePasswordScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.security),
            title: const Text("Two-Step Verification"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const
                TwoStepVerificationScreen(),
                ),
              );

            },
          ),

          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text("Account Visibility"),
            subtitle: const Text("Public"),
            trailing: const
            Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const
                AccountVisibilityScreen(),

                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("Show Email to Employers"),
            trailing: const
            Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const
                ShowEmailToEmployersScreen(),
                ),
              );
            },


          ),

          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Show Phone Number"),
            trailing: const
            Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const
                ShowPhoneNumberScreen(),
                ),
              );
            },

          ),

          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("Blocked Companies"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const
                BlockedCompaniesScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete Account"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const
                DeleteAccountScreen(),
                ),
              );
            },
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
                      PrivacyPolicyScreen(),

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