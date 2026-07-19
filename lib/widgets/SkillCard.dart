import 'package:afghanlance/constants.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const SkillCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 95,
      margin: const EdgeInsets.only(right: 12),

      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),

      decoration: BoxDecoration(
        color: isDark ? kDarkSurfaceColor : kLightColor,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: isDark ? Colors.white10 : kSecondColor.withOpacity(0.15),
          width: 1,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.15 : 0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            height: 45,
            width: 45,

            decoration: BoxDecoration(
              color: kSecondColor.withOpacity(0.12),

              shape: BoxShape.circle,
            ),

            child: Icon(icon, size: 24, color: kThirdColor),
          ),

          const SizedBox(height: 10),

          Text(
            label,

            textAlign: TextAlign.center,

            maxLines: 1,

            overflow: TextOverflow.ellipsis,

            style: TextStyle(
              fontSize: 12,

              fontWeight: FontWeight.w600,

              color: isDark ? Colors.white : k4Color,
            ),
          ),
        ],
      ),
    );
  }
}
