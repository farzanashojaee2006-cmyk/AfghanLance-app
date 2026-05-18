import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0;
  final tabs = ["About Me", "Projects", "My Ideas", "Reviews"];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    Color primaryColor = kThirdColor;
    Color backgroundColor = isDark ? const Color(0xFF121212) : kFirstColor;
    Color cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    Color textColor = isDark ? Colors.white : Colors.black;
    Color subTextColor = isDark ? Colors.white70 : Colors.black54;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "AfghanLance",
                      style: TextStyle(
                          color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage("https://i.pravatar.cc/100?img=5"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -5,
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 18,
                            child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text("Najia Sadr",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor)),
                    Text("UI/UX Designer", style: TextStyle(color: subTextColor)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 16, color: primaryColor),
                        const SizedBox(width: 4),
                        Text("Kabul, Afghanistan", style: TextStyle(color: subTextColor)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          actionBtn(Icons.check, "Accept", primaryColor, textColor),
                          actionBtn(Icons.settings, "Settings", primaryColor, textColor),
                          actionBtn(Icons.work, "Portfolio", primaryColor, textColor),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.black26 : kFirstColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StatItem("45", "Completed", textColor, subTextColor),
                          StatItem("4.9 ★", "Rating", textColor, subTextColor),
                          StatItem("\$25,300", "Earnings", textColor, subTextColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Me", style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
                    const SizedBox(height: 8),
                    Text(
                      "Creative UI/UX designer with 4+ years of experience. I love turning ideas into beautiful experiences.",
                      style: TextStyle(color: subTextColor),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: ["Flutter", "Figma", "UI Design"].map((skill) => Chip(
                        label: Text(skill, style: TextStyle(color: textColor)),
                        backgroundColor: isDark ? Colors.white10 : kFirstColor,
                      )).toList(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionBtn(IconData icon, String text, Color primary, Color textColor) {
    return Expanded(
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
            Text(text, style: TextStyle(color: textColor, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String title;
  final Color textColor;
  final Color subTextColor;
  const StatItem(this.value, this.title, this.textColor, this.subTextColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
        const SizedBox(height: 4),
        Text(title, style: TextStyle(color: subTextColor, fontSize: 12)),
      ],
    );
  }
}
