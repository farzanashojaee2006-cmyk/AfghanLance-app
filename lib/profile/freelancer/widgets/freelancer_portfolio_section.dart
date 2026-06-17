import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

import '../../models/freelancer_profile_model.dart';
import '../../widgets/profile_card.dart';

class FreelancerPortfolioSection extends StatelessWidget {
  final FreelancerProfileModel profile;

  const FreelancerPortfolioSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (profile.portfolioImages.isEmpty) {
      return ProfileCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Portfolio",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 14),
            const Text(
              "No portfolio added yet",
              style: TextStyle(color: Colors.grey),
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
            "Portfolio",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 145,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: profile.portfolioImages.length,
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    profile.portfolioImages[index],
                    width: 120,
                    height: 145,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        width: 120,
                        height: 145,
                        color:
                        isDark ? Colors.white10 : const Color(0xFFE4F1F0),
                        child: Icon(
                          Icons.image_outlined,
                          color: kThirdColor,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}