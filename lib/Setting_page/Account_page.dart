import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [

            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.person, size: 50),
            ),

            SizedBox(height: 25),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("First Name"),
              subtitle: const Text("Zainab"),
            ),

            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("Last Name"),
              subtitle: const Text("Mohammadi"),
            ),

            ListTile(
              leading: const Icon(Icons.email),
              title: const Text("Email"),
              subtitle: const Text("zainab@gmail.com"),
            ),

            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text("Birth Year"),
              subtitle: const Text("2003"),
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Bio"),
              subtitle: const Text(
                "Flutter Developer and Job Seeker",
              ),
            ),

            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Change Phone Number"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            ),

          ],
        ),
      ),
    );
  }
}
