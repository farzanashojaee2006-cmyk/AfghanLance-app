import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

class ProfilePrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;

  const ProfilePrimaryButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: filled ? kThirdColor : Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          border: filled ? null : Border.all(color: kThirdColor, width: 1.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: filled ? Colors.white : kThirdColor),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: filled ? Colors.white : kThirdColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}