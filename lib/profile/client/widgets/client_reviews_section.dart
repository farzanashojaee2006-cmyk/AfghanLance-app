import 'package:flutter/material.dart';

import '../../models/client_profile_model.dart';
import '../../widgets/profile_card.dart';

class ClientReviewsSection extends StatelessWidget {
  final ClientProfileModel profile;

  const ClientReviewsSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (profile.reviews.isEmpty) {
      return ProfileCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reviews",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 14),
            const Text(
              "No reviews yet",
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
            "Freelancer Reviews",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 14),
          ...profile.reviews.map(
                (review) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : const Color(0xFFF4FAF9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                review,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}