import 'package:flutter/material.dart';
import '../../constants.dart';

class OnboardingBackground extends StatelessWidget {
  final Widget child;

  const OnboardingBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: isDark ?  Color(0xFF121212) : kFirstColor,
      ),
      child: child,
    );
  }
}
