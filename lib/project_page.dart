import 'package:flutter/material.dart';
import '../constants.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF121212) : kFirstColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work_outline_rounded,
              size: 80,
              color: kThirdColor,
            ),

            SizedBox(height: 20),

            Text(
              "Projects",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color:
                isDark ? Colors.white : Colors.black,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Coming Soon",
              style: TextStyle(
                fontSize: 16,
                color: isDark
                    ? Colors.white60
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}