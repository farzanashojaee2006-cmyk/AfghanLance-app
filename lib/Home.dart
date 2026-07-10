import 'package:afghanlance/SkillCard.dart';
import 'package:afghanlance/help&Support_Page.dart';
import 'package:afghanlance/help_center/screens/help_center.dart';
import 'package:afghanlance/helpePage.dart';
import 'package:afghanlance/post_page.dart';
import 'package:afghanlance/profile/profile_page.dart';
import 'package:afghanlance/projectCards.dart';
import 'package:afghanlance/project_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';
import 'package:afghanlance/messenger/pages/chat_list_page.dart';
import 'Setting_page/Screen_page/Screen_page.dart';
import 'auth/logout_page.dart';
import 'package:afghanlance/notification_page.dart';

class HomePage extends StatefulWidget {
  final bool isClient;

  const HomePage({super.key, required this.isClient});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  late bool isClient;

  int selectedIndex = 0;

  String fullName = "User";
  String email = "";
  bool isLoadingUser = true;

  String profileImage = "assets/images/profile.png";

  @override
  void initState() {
    super.initState();
    isClient = widget.isClient;
    loadUserData();
  }

  Widget animatedItem({required int index, required Widget child}) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 350 + (index * 120)),
      tween: Tween(begin: 20, end: 0),
      curve: Curves.easeOut,
      builder: (context, value, widget) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: Opacity(opacity: 1 - (value / 20), child: widget),
        );
      },
      child: child,
    );
  }

  Widget drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool danger = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          hoverColor: kThirdColor.withOpacity(.05),
          splashColor: kThirdColor.withOpacity(.15),
          highlightColor: kThirdColor.withOpacity(.08),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: danger
                      ? Colors.red.withOpacity(.10)
                      : kThirdColor.withOpacity(.10),
                  child: Icon(
                    icon,
                    size: 20,
                    color: danger ? Colors.red : kThirdColor,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider getProfileImage() {
    if (profileImage.startsWith('http')) {
      return NetworkImage(profileImage);
    }

    return AssetImage(profileImage);
  }

  Future<void> loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final data = doc.data();

    if (data == null) return;

    setState(() {
      profileImage = data['profileImage'] ?? "assets/images/profile.png";
      fullName = "${data['firstName'] ?? ''} ${data['lastName'] ?? ''}".trim();

      email = data['email'] ?? user.email ?? "";
      isLoadingUser = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 45, bottom: 22),
              decoration: const BoxDecoration(
                color: kThirdColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(38),
                  bottomRight: Radius.circular(38),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundImage: getProfileImage(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    fullName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),
            animatedItem(
              index: 0,
              child: drawerItem(
                icon: Icons.person_outline,
                title: "Profile",
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfilePage(isClient: isClient),
                    ),
                  );
                },
              ),
            ),


            animatedItem(
              index: 1,
              child: drawerItem(
                icon: Icons.notifications_none,
                title: "Notifications",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NotificationPage()),
                  );
                },
              ),
            ),

            animatedItem(
              index: 2,
              child: drawerItem(
                icon: Icons.settings_outlined,
                title: "Settings",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SettingsPage()),
                  );
                },
              ),
            ),

            animatedItem(
              index: 3,
              child: drawerItem(
                icon: Icons.help_outline,
                title: "Help & Support",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HelpCenterScreen()),
                  );
                },
              ),
            ),

            const Spacer(),

            animatedItem(
              index: 4,
              child: drawerItem(
                icon: Icons.logout,
                title: "Log out",
                danger: true,
                onTap: () {
                  LogoutPage.showLogoutDialog(context);
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: isDark ? Color(0xFF121212) : kFirstColor,

      appBar: AppBar(
        elevation: 0,

        backgroundColor: isDark ? Color(0xFF121212) : kFirstColor,

        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),

        title: Text(
          'Afghanlance',

          style: TextStyle(
            color: isDark ? Colors.white : kThirdColor,

            fontWeight: FontWeight.bold,
          ),
        ),

        actions: selectedIndex == 0
            ? [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('notifications')
                      .where(
                        'userId',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                      )
                      .where('isRead', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    int unreadCount = snapshot.data?.docs.length ?? 0;

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications_none,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NotificationPage(),
                              ),
                            );
                          },
                        ),

                        if (unreadCount > 0)
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                unreadCount.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kThirdColor,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePostScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ]
            : [],
      ),
      body: selectedIndex == 1
          ? const ProjectsPage()
          : selectedIndex == 2
          ? ChatListPage()
          : selectedIndex == 3
          ? ProfilePage(isClient: isClient)
          : isClient
          ? ClientView(isClient: isClient)
          : FreelancerView(isClient: isClient),

      bottomNavigationBar: Container(
        height: 85,

        margin: EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: isDark ? Color(0xFF1E1E1E) : Colors.white,

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

              child: Container(
                height: 60,
                width: 60,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: selectedIndex == 1 ? kThirdColor : Colors.transparent,

                  boxShadow: selectedIndex == 1
                      ? [BoxShadow(color: Colors.black12, blurRadius: 8)]
                      : [],
                ),
                child: Icon(
                  Icons.work_outline,
                  color: selectedIndex == 1 ? Colors.white : Colors.grey,
                  size: 30,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },

              child: Container(
                height: 60,
                width: 60,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: selectedIndex == 2 ? kThirdColor : Colors.transparent,

                  boxShadow: selectedIndex == 2
                      ? [BoxShadow(color: Colors.black12, blurRadius: 8)]
                      : [],
                ),

                child: Icon(
                  Icons.message_outlined,
                  color: selectedIndex == 2 ? Colors.white : Colors.grey,
                  size: 30,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
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
            padding: EdgeInsets.all(16),

            child: TextField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),

              decoration: InputDecoration(
                hintText: 'Search projects, skills and ...',

                hintStyle: TextStyle(
                  color: isDark ? Colors.white54 : Colors.grey,
                ),

                prefixIcon: Icon(Icons.search, color: Colors.grey),

                suffixIcon: Icon(Icons.tune, color: Colors.grey),

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
            padding: EdgeInsets.symmetric(horizontal: 16),

            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isClient
                          ? kThirdColor
                          : Colors.transparent,

                      foregroundColor: !isClient ? Colors.white : kThirdColor,

                      side: BorderSide(color: kThirdColor),

                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),

                    onPressed: () {},

                    child: Text("Freelancer"),
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isClient
                          ? kThirdColor
                          : Colors.transparent,

                      foregroundColor: isClient ? Colors.white : kThirdColor,
                      side: BorderSide(color: kThirdColor),

                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),

                    onPressed: () {},

                    child: Text("Employer"),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),

            padding: EdgeInsets.all(20),

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

                      SizedBox(height: 10),

                      Text(
                        subtitle,

                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey,
                        ),
                      ),

                      SizedBox(height: 20),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE6F4F7),
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

                SizedBox(width: 12),

                Container(
                  height: 110,
                  width: 110,

                  decoration: BoxDecoration(
                    color: isDark ? Colors.white12 : Color(0xFFF0F9F0),

                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Icon(Icons.laptop_mac, size: 55, color: kThirdColor),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

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
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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

          SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
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
