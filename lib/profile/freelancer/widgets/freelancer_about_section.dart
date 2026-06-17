import 'package:flutter/material.dart';

import '../../models/freelancer_profile_model.dart';
import '../../widgets/profile_card.dart';

class FreelancerAboutSection extends StatelessWidget {
  final FreelancerProfileModel profile;

  const FreelancerAboutSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ProfileCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Text(
            profile.about,
            style: TextStyle(
              height: 1.5,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}