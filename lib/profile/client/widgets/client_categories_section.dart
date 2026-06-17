import 'package:flutter/material.dart';

import '../../models/client_profile_model.dart';
import '../../widgets/profile_card.dart';
import '../../widgets/profile_chip.dart';

class ClientCategoriesSection extends StatelessWidget {
  final ClientProfileModel profile;

  const ClientCategoriesSection({
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
            "Project Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
            profile.categories.map((e) => ProfileChip(text: e)).toList(),
          ),
        ],
      ),
    );
  }
}