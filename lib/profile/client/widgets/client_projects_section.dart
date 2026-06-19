import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

import '../../models/client_profile_model.dart';
import '../../widgets/profile_card.dart';

class ClientProjectsSection extends StatelessWidget {
  final ClientProfileModel profile;

  const ClientProjectsSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (profile.recentProjects.isEmpty) {
      return ProfileCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Projects",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 14),
            Text(
              "No recent projects yet",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ProfileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Projects",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 14),
          ...profile.recentProjects.map(
                (project) => Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : Color(0xFFF4FAF9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.work_outline_rounded, color: kThirdColor),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      project,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}