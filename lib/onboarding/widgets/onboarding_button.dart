import 'package:flutter/material.dart';
import '../../constants.dart';

class OnboardingButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback onPressed;

  const OnboardingButton({
    super.key,
    required this.text,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: kThirdColor,
          disabledBackgroundColor:
          isDark ?  Color(0xFF2A2A2A) :  Color(0xFFD8D8D8),
          elevation: enabled ? 8 : 0,
          shadowColor: kThirdColor.withOpacity(.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: enabled ? Colors.white : Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}