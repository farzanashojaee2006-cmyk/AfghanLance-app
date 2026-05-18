import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color primary = Color(0xFF2E7D73);
  static const Color bg = Color(0xFFD6E3E6);
  static const Color card = Color(0xFFF2F2F2);



  int selectedTab = 0;
  int selectedBottomIndex = 3;
  int notificationCount = 3;

  final tabs = ["About Me", "Projects", "My Ideas", "Reviews"];

  final Map<String, dynamic> profile = {
    "name": "Najia Sadr",
    "role": "UI/UX Designer",
    "location": "Kabul, Afghanistan",
    "about":
    "Creative UI/UX designer with 4+ years of experience in mobile and web design. I love turning ideas into beautiful, user-friendly experiences.",
    "image": "https://i.pravatar.cc/100?img=5",
    "completed": "45",
    "rating": "4.9 ★",
    "earnings": "\$25,300",
  };

  final List<String> skills = [
    "Flutter",
    "Figma",
    "UI Design",
    "UX Research",
    "Adobe XD",
  ];

  final List<Map<String, String>> projects = [
    {
      "title": "E-Commerce App",
      "description": "Modern shopping app UI with Flutter"
    },
    {
      "title": "Banking Dashboard",
      "description": "Clean financial dashboard experience"
    },
    {
      "title": "Food Delivery UI",
      "description": "Fast and responsive food ordering app"
    },
  ];

  final List<String> ideas = [
    "AI Powered Freelancer Platform",
    "Smart Education App for Afghanistan",
    "Women Community Networking Platform",
  ];

  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Ahmad",
      "comment": "Excellent designer and very professional.",
      "rating": 5
    },
    {
      "name": "Sara",
      "comment": "Amazing UI work and fast delivery.",
      "rating": 4
    },
  ];



  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  void onBottomTap(int index) {
    setState(() {
      selectedBottomIndex = index;
    });

    List<String> pages = [
      "Home",
      "Work",
      "Messages",
      "Profile",
    ];

    showMessage("${pages[index]} clicked");
  }

  void addNotification() {
    setState(() {
      notificationCount++;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,










      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [





              const SizedBox(height: 20),



              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [



                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage:
                          NetworkImage(profile['image']),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -5,
                          child: GestureDetector(
                            onTap: () {
                              showMessage("Change profile photo");
                            },
                            child: const CircleAvatar(
                              backgroundColor: primary,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      profile['name'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      profile['role'],
                      style: const TextStyle(color: Colors.black54),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: primary,
                        ),
                        const SizedBox(width: 4),
                        Text(profile['location']),
                      ],
                    ),

                    const SizedBox(height: 15),



                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          actionBtn(
                            Icons.check,
                            "Accept",
                                () {
                              showMessage("Accepted successfully");
                            },
                          ),
                          actionBtn(
                            Icons.settings,
                            "Settings",
                                () {
                              showMessage("Settings opened");
                            },
                          ),
                          actionBtn(
                            Icons.work,
                            "Portfolio",
                                () {
                              showMessage("Portfolio opened");
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),



                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StatItem(profile['completed'], "Completed"),
                          StatItem(profile['rating'], "Rating"),
                          StatItem(profile['earnings'], "Earnings"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),



                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(tabs.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: selectedTab == index
                                    ? primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  color: selectedTab == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 15),



                    buildTabContent(),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildTabContent() {
    switch (selectedTab) {
      case 0:
        return buildAboutSection();

      case 1:
        return buildProjectsSection();

      case 2:
        return buildIdeasSection();

      case 3:
        return buildReviewsSection();

      default:
        return buildAboutSection();
    }
  }



  Widget buildAboutSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Me",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(profile['about']),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: skills
                .map(
                  (skill) => Chip(
                label: Text(skill),
              ),
            )
                .toList(),
          )
        ],
      ),
    );
  }



  Widget buildProjectsSection() {
    return Column(
      children: projects.map((project) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: const Icon(Icons.work, color: primary),
            title: Text(project['title']!),
            subtitle: Text(project['description']!),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
              onPressed: () {
                showMessage("${project['title']} opened");
              },
            ),
          ),
        );
      }).toList(),
    );
  }



  Widget buildIdeasSection() {
    return Column(
      children: ideas.map((idea) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Icon(Icons.lightbulb, color: primary),
              const SizedBox(width: 10),
              Expanded(child: Text(idea)),
              IconButton(
                onPressed: () {
                  showMessage("Idea liked");
                },
                icon: const Icon(Icons.favorite_border),
              )
            ],
          ),
        );
      }).toList(),
    );
  }



  Widget buildReviewsSection() {
    return Column(
      children: reviews.map((review) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    review['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      review['rating'],
                          (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(review['comment']),
            ],
          ),
        );
      }).toList(),
    );
  }



  Widget actionBtn(
      IconData icon,
      String text,
      VoidCallback onTap,
      ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: primary),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: primary, size: 18),
              const SizedBox(width: 5),
              Text(
                text,
                style: const TextStyle(color: primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String title;

  const StatItem(this.value, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(title),
      ],
    );
  }
}

