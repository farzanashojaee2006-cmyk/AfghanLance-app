import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bio_page.dart';
import 'BirthYear_page.dart';
import 'Change_phone_Number_page.dart';
import 'Email_page.dart';
import 'First_name_page.dart';
import 'Last_Name_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});
  @override
  State<AccountPage>createState() =>
      _AccountPageState();
}
class _AccountPageState extends State<AccountPage> {

  String firstName = "Zainab";
  String lastName = "Muhammadi";
  String email = "zainab@gmail.com";
  String birthYear = "2003";
  String bio = "Flutter Developer and Job Seeker";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      firstName =
          prefs.getString('firstName') ?? 'Zainab';
      email = prefs.getString('email') ?? 'zainab@gmail.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: ListView(
        children: [



          ListTile(

            leading: const Icon(Icons.person),
            title: const Text("First Name"),
            subtitle: const Text("First Name"),
            trailing: const
            Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (context) => const
                  FirstNameScreen(),

                ),

              );

            },

          ),



          ListTile(

            leading: const Icon(Icons.person_outline),
            title: const Text("Last Name"),
            subtitle: const Text("Last Name"),
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const
                  LastNameScreen(),

                ),
              );
            },
          ),



          ListTile(

            leading: const Icon(Icons.email),
            title: const Text("Email"),
            subtitle: const Text("Email"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const
                  EmailScreen(),

                ),

              );

            },

          ),



          ListTile(

            leading: const Icon(Icons.calendar_month),
            title: const Text("Birth Year"),
            subtitle: const Text("Birth Year"),
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BirthYearScreen(),

                ),

              );

            },

          ),

          ListTile(

            leading: const Icon(Icons.info),
            title: const Text("Bio"),
            subtitle: const Text(
              "Bio",
            ),

            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BioScreen(),

                ),

              );
            },
          ),



          ListTile(

            leading: const Icon(Icons.phone),
            title: const Text("Change Phone Number"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePhoneNumberScreen(),

                ),

              );

            },

          ),



          const SizedBox(height: 30),



          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),


          ),


        ],
      ),
    );






  }
}









