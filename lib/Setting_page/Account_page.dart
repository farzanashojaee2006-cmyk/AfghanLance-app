import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: ListView(
          children: [

            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.person, size: 50),
            ),

            SizedBox(height: 25),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("First Name"),
              subtitle: Text("Zainab"),
            ),

            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Last Name"),
              subtitle: Text("Mohammadi"),
            ),

            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("zainab@gmail.com"),
            ),

            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Birth Year"),
              subtitle: Text("2003"),
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text("Bio"),
              subtitle: Text(
                "Flutter Developer and Job Seeker",
              ),
            ),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Change Phone Number"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout),
              label: Text("Logout"),
            ),

          ],
        ),
      ),
    );
  }
}
