import 'package:afghanlance/SkillCard.dart';
import 'package:afghanlance/profile_page.dart';
import 'package:afghanlance/projactCards.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/Conestant.dart';

class HomePage extends StatefulWidget {
  final bool isClient;

  const HomePage({super.key, required this.isClient});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  late bool isClient;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    isClient = widget.isClient;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,

        child: ListView(
          padding: EdgeInsets.zero,

          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: isDark ? Colors.black87 : kThirdColor,
              ),

              accountName: const Text("Farzana"),

              accountEmail: const Text("farzanashojaee2006@gmail.com"),

              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  );
                },

                child: const CircleAvatar(
                  backgroundColor: Colors.white,

                  child: Icon(Icons.person, size: 40, color: Colors.teal),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.person_outline, color: kThirdColor),

              title: Text(
                "Profile",

                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.settings_outlined, color: kThirdColor),

              title: Text(
                "Settings",

                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),

              onTap: () {},
            ),


            ListTile(
              leading: Icon(Icons.chat_outlined, color: kThirdColor),

              title: Text(
                "Chat with Uma",

                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),

              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.help_outline, color: kThirdColor),

              title: Text(
                "Help & Support",

                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),

              onTap: () {},
            ),


            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),

              title: Text(
                "Log out",

                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),

              onTap: () {},
            ),
          ],
        ),
      ),

      backgroundColor: isDark ? const Color(0xFF121212) : KFirtsColor,

      appBar: AppBar(
        elevation: 0,

        backgroundColor: isDark ? const Color(0xFF121212) : KFirtsColor,

        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),

        title: Text(
          'Afghanlance',

          style: TextStyle(
            color: isDark ? Colors.white : kThirdColor,

            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,

              color: isDark ? Colors.white : Colors.black87,
            ),

            onPressed: () {},
          ),


          Padding(
            padding: const EdgeInsets.only(right: 12),

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kThirdColor,

                shape: const CircleBorder(),

                padding: const EdgeInsets.all(12),
              ),

              onPressed: () {},

              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),

      body: isClient
          ? ClientView(isClient: isClient)
          : FreelancerView(isClient: isClient),

      bottomNavigationBar: Container(
        height: 85,

        margin: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,

          borderRadius: BorderRadius.circular(28),

          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },

              child: Container(
                height: 60,
                width: 60,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: selectedIndex == 0 ? kThirdColor : Colors.transparent,

                  boxShadow: selectedIndex == 0
                      ? [BoxShadow(color: Colors.black12, blurRadius: 8)]
                      : [],
                ),

                child: Icon(
                  Icons.home,

                  color: selectedIndex == 0 ? Colors.white : Colors.grey,

                  size: 30,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.work_outline,

                    color: selectedIndex == 1 ? kThirdColor : Colors.grey,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Projects",

                    style: TextStyle(
                      color: selectedIndex == 1 ? kThirdColor : Colors.grey,

                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.message_outlined,

                    color: selectedIndex == 2 ? kThirdColor : Colors.grey,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Messages",

                    style: TextStyle(
                      color: selectedIndex == 2 ? kThirdColor : Colors.grey,

                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },

              child: Container(
                height: 60,
                width: 60,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: selectedIndex == 3 ? kThirdColor : Colors.transparent,

                  boxShadow: selectedIndex == 3
                      ? [BoxShadow(color: Colors.black12, blurRadius: 8)]
                      : [],
                ),

                child: Icon(
                  Icons.person_outline,

                  color: selectedIndex == 3 ? Colors.white : Colors.grey,

                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FreelancerView extends StatelessWidget {
  final bool isClient;

  const FreelancerView({super.key, required this.isClient});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return _CommonView(
      isClient: isClient,
      isDark: isDark,

      title: 'Find Your Perfect Project',

      subtitle: 'Thousands of projects waiting for your skills.',
    );
  }
}

class ClientView extends StatelessWidget {
  final bool isClient;

  const ClientView({super.key, required this.isClient});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return _CommonView(
      isClient: isClient,
      isDark: isDark,

      title: 'Find Your Perfect Freelancer',

      subtitle:
          'Thousands of talented Afghan freelancer ready for your project.',
    );
  }
}

class _CommonView extends StatelessWidget {
  final bool isClient;
  final bool isDark;
  final String title;
  final String subtitle;

  const _CommonView({
    required this.isClient,
    required this.isDark,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),

              decoration: InputDecoration(
                hintText: 'Search projects, skills and ...',

                hintStyle: TextStyle(
                  color: isDark ? Colors.white54 : Colors.grey,
                ),

                prefixIcon: const Icon(Icons.search, color: Colors.grey),

                suffixIcon: const Icon(Icons.tune, color: Colors.grey),

                filled: true,

                fillColor: isDark ? Colors.white10 : Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),

                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isClient
                          ? kThirdColor
                          : Colors.transparent,

                      foregroundColor: isClient ? Colors.white : kThirdColor,

                      side: BorderSide(color: kThirdColor),

                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),

                    onPressed: () {},

                    child: const Text("Freelancer"),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isClient
                          ? kThirdColor
                          : Colors.transparent,

                      foregroundColor: !isClient ? Colors.white : kThirdColor,

                      side: BorderSide(color: kThirdColor),

                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),

                    onPressed: () {},

                    child: const Text("Employer"),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.white,

              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        title,

                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,

                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        subtitle,

                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE6F4F7),
                        ),

                        onPressed: () {},

                        child: Text(
                          "Browse Projects",

                          style: TextStyle(color: kThirdColor),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  height: 110,
                  width: 110,

                  decoration: BoxDecoration(
                    color: isDark ? Colors.white12 : const Color(0xFFF0F9F0),

                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Icon(Icons.laptop_mac, size: 55, color: kThirdColor),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Text(
              'Suggested Projects',

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,

                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),

          const ProjectCard(
            title: 'Build Mobile App with Flutter',

            company: 'Afghan Tech Company',

            tags: ['Flutter', 'Dart', 'UI/UX'],

            budget: '\$800 - \$1200',

            time: '3 days ago',

            proposals: "5",
          ),

          const ProjectCard(
            title: 'UI/UX Design for E-commerce Website',

            company: 'Kabul Online Store',

            tags: ['UI/UX', 'Figma', 'Web Design'],

            budget: '\$500 - \$900',

            time: '1 day ago',

            proposals: "8",
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Skills',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text('View All', style: TextStyle(color: kSecondColor)),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                SkillCard(icon: Icons.phone_android, label: 'Mobile Dev'),
                SkillCard(icon: Icons.design_services, label: 'Logo Design'),
                SkillCard(icon: Icons.web, label: 'Web Dev'),
                SkillCard(icon: Icons.translate, label: 'Translation'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
