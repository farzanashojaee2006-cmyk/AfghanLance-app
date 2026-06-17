import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

import '../../models/freelancer_profile_model.dart';
import '../../widgets/profile_card.dart';

class FreelancerLinksSection extends StatelessWidget {
  final FreelancerProfileModel profile;

  const FreelancerLinksSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (profile.portfolioLink.trim().isEmpty) {
      return SizedBox();
    }

    return ProfileCard(
      child: Row(
        children: [
          Icon(
            Icons.link_rounded,
            color: kThirdColor,
            size: 28,
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Links",
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  profile.portfolioLink,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kThirdColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}