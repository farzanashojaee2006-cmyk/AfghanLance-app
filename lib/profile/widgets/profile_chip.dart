import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

class ProfileChip extends StatelessWidget {
  final String text;

  const ProfileChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        color: isDark ? kThirdColor.withOpacity(0.9) : const Color(0xFFE4F1F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isDark ? Colors.white70 : kThirdColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}