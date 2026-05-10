
import 'package:afghanlance/Home.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isClient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F4442),
      body: Stack(
        children:[ Positioned.fill(
          child: Image.asset("assets/images/p.jpg", fit: BoxFit.cover),
        ),
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.6),)),
          Center(
            child: Image.asset(
              "assets/images/hand.png",
              width: 600,
              height: 700,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Work",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Your Way",
                    style: TextStyle(
                      color: Color(0xFF2FD1C5),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),
                  Text(
                    "Find talent, manage projects and pay — all in one flow.",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),

                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: _buildCard(
                          title: "I’m a client",
                          subtitle: "Hire the right talent",
                          selected: isClient,
                          onTap: () {
                            setState(() => isClient = true);
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: _buildCard(
                          title: "I’m a freelancer",
                          subtitle: "Find work that matches",
                          selected: !isClient,
                          onTap: () {
                            setState(() => isClient = false);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomePage(isClient: isClient),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1D837F),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Create account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Center(
                    child: Text(
                      "Already have an account? Log in",
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withOpacity(0.15)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? Colors.tealAccent : Colors.white24,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.person, color: Colors.white),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white60, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
