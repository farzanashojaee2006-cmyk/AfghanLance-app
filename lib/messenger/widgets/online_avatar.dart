import 'package:flutter/material.dart';
import '../../constants.dart';

class OnlineAvatar extends StatelessWidget {
  final String name;
  final bool isOnline;
  final double radius;

  const OnlineAvatar({
    super.key,
    required this.name,
    required this.isOnline,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: kFirstColor,
          child: Text(
            name.isNotEmpty ? name[0].toUpperCase() : '?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: radius * .7,
              color: kThirdColor,
            ),
          ),
        ),

        if (isOnline)
          Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              width: radius * .45,
              height: radius * .45,
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark
                      ? const Color(0xFF121212)
                      : Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}