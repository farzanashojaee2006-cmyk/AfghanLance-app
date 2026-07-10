import 'package:flutter/material.dart';
import '../Home.dart';
import '../constants.dart';
import 'widgets/onboarding_background.dart';

class SuccessScreen extends StatefulWidget {
  final bool isClient;

  const SuccessScreen({
    super.key,
    required this.isClient,
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 2),
          () {
        if (!mounted) return;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(
              isClient: widget.isClient,
            ),
          ),
              (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: OnboardingBackground(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kThirdColor,
                    ),
                    child:  Icon(
                      Icons.check_rounded,
                      size: 65,
                      color: kLightColor,
                    ),
                  ),
                  SizedBox(height: 30),

                  Text(
                    "Profile Completed",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ), SizedBox(height: 12),

                  Text(
                    "Welcome to AfghanLance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: isDark
                          ? Colors.white70
                          : Colors.black54,
                    ),
                  ), SizedBox(height: 12),

                  Text(
                    "Your profile is ready.\nLet's start your journey.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: isDark
                          ? Colors.white54
                          : Colors.black45,
                    ),
                  ),

                   SizedBox(height: 40),

                   CircularProgressIndicator(
                    color: kThirdColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}