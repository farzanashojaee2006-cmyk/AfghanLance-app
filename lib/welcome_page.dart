import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

import 'Conestant.dart';

class WelcomePageOne extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const WelcomePageOne({super.key, required this.onToggleTheme});

  @override
  State<WelcomePageOne> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePageOne> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _blurAnimation;
  late Animation<double> _textOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeIn)),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(

          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
          ),
        );

    _blurAnimation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0, curve: Curves.easeIn)),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {

        Navigator.pushReplacementNamed(context, '/welcome');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [k4Color, kThirdColor, Color(0xFF0A1F1D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [

            Positioned(
              top: -50,
              left: -50,
              child: _buildBackgroundCircle(kSecondColor.withOpacity(0.1), 200),
            ),
            Positioned(
              bottom: 100,
              right: -30,
              child: _buildBackgroundCircle(KFirtsColor.withOpacity(0.1), 150),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.03),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: kSecondColor.withOpacity(0.2),
                                  blurRadius: _blurAnimation.value,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) => const LinearGradient(
                                    colors: [Colors.white, kSecondColor, KFirtsColor],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                                  child: const Text(
                                    'AfghanLance',
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),

                                Opacity(
                                  opacity: _textOpacity.value,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 1,
                                        width: 100,
                                        margin: const EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.transparent, kSecondColor.withOpacity(0.5), Colors.transparent],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Afghanistan Freelancing Platform",
                                        textAlign: TextAlign.center,
                                        style: textLightColor.copyWith(
                                          color: kLightColor.withOpacity(0.8),
                                          fontSize: 14,
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: color, blurRadius: 100, spreadRadius: 50)],
      ),
    );
  }
}
