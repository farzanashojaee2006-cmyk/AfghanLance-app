import 'package:flutter/material.dart';
import '../../constants.dart';

class SelectableCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const SelectableCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration:  Duration(milliseconds: 220),
        padding:  EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? kThirdColor.withOpacity(isDark ? .18 : .08)
              : isDark
              ?  Color(0xFF1E1E1E)
              : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected
                ? kThirdColor
                : isDark
                ? Colors.white12
                : Colors.black12,
            width: selected ? 1.6 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? .18 : .05),
              blurRadius: 18,
              offset:  Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: selected
                        ? kThirdColor
                        : isDark
                        ? Colors.white70
                        : Colors.black87,
                  ), SizedBox(height: 14),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: selected
                          ? kThirdColor
                          : isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ), SizedBox(height: 6),

                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      height: 1.4,
                      color: isDark
                          ? Colors.white54
                          : Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            if (selected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: kThirdColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child:  Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}