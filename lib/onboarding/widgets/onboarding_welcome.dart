import 'package:flutter/material.dart';
import '../../constants.dart';
import 'onboarding_button.dart';

class OnboardingWelcome extends StatelessWidget {
  final VoidCallback onStart;

  const OnboardingWelcome({
    super.key,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [SizedBox(height: 32),

        Text(
          "AfghanLance",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 10),

        Text(
          "Find talent. Get work. Grow together.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDark ? Colors.white60 : Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ), SizedBox(height: 46),

        Container(
          width: double.infinity,
          padding:  EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: isDark ?  Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isDark ? Colors.white10 : Colors.black12,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? .22 : .07),
                blurRadius: 28,
                offset:  Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                Icons.people_alt_outlined,
                size: 72,
                color: kThirdColor,
              ), SizedBox(height: 24),
              Text(
                "Let’s build your\nprofessional profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  height: 1.15,
                  fontWeight: FontWeight.w900,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 14),
              Text(
                "Answer a few quick questions so AfghanLance can personalize your experience.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ],
          ),
        ),

        Spacer(),

        OnboardingButton(
          text: "Get Started",
          enabled: true,
          onPressed: onStart,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}