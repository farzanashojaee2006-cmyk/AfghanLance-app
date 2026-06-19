import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';
import 'profile_chip.dart';
import 'profile_primary_button.dart';
import 'profile_stat_item.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final String location;

  final bool isVerified;

  final List<String> chips;

  final String stat1Value;
  final String stat1Label;
  final IconData stat1Icon;
  final Color stat1Color;

  final String stat2Value;
  final String stat2Label;
  final IconData stat2Icon;
  final Color stat2Color;

  final String stat3Value;
  final String stat3Label;
  final IconData stat3Icon;
  final Color stat3Color;

  final VoidCallback onEditTap;
  final VoidCallback onSecondButtonTap;

  final String secondButtonText;

  const ProfileHeader({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.location,
    required this.isVerified,
    required this.chips,
    required this.stat1Value,
    required this.stat1Label,
    required this.stat1Icon,
    required this.stat1Color,
    required this.stat2Value,
    required this.stat2Label,
    required this.stat2Icon,
    required this.stat2Color,
    required this.stat3Value,
    required this.stat3Label,
    required this.stat3Icon,
    required this.stat3Color,
    required this.onEditTap,
    required this.onSecondButtonTap,
    required this.secondButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardColor = isDark
        ? Color(0xFF1A1A1A)
        : Colors.white;

    final textColor = isDark
        ? Colors.white
        : Colors.black;

    final subTextColor = isDark
        ? Colors.white60
        : Colors.black54;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, 18, 18, 24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? .25 : .07),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      kThirdColor,
                      kFirstColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              Positioned(
                top: 95,
                left: -30,
                right: -30,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.elliptical(220, 95),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 14,
                right: 14,
                child: InkWell(
                  onTap: onEditTap,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.92),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      color: kThirdColor,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 20,
                top: 65,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 66,
                      backgroundColor: cardColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),

                    if (isVerified)
                      Positioned(
                        right: 4,
                        bottom: 8,
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: kThirdColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: cardColor,
                              width: 3,
                            ),
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 19,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Positioned(
                left: 160,
                top: 120,
                right: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        if (isVerified)
                          const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.verified,
                              color: kThirdColor,
                              size: 22,
                            ),
                          ),
                      ],
                    ),

                    SizedBox(height: 5),

                    Text(
                      title,
                      style: TextStyle(
                        color: kThirdColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),

                    SizedBox(height: 7),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 17,
                          color: subTextColor,
                        ),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            location,
                            style: TextStyle(
                              color: subTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 72),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: chips
                .map((e) => ProfileChip(text: e))
                .toList(),
          ),

          SizedBox(height: 26),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileStatItem(
                icon: stat1Icon,
                value: stat1Value,
                label: stat1Label,
                iconColor: stat1Color,
              ),

              _divider(isDark),

              ProfileStatItem(
                icon: stat2Icon,
                value: stat2Value,
                label: stat2Label,
                iconColor: stat2Color,
              ),

              _divider(isDark),

              ProfileStatItem(
                icon: stat3Icon,
                value: stat3Value,
                label: stat3Label,
                iconColor: stat3Color,
              ),
            ],
          ),

          SizedBox(height: 26),

          Row(
            children: [
              Expanded(
                child: ProfilePrimaryButton(
                  text: "Contact",
                  icon: Icons.chat_bubble_outline_rounded,
                  onTap: () {},
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ProfilePrimaryButton(
                  text: secondButtonText,
                  icon: Icons.open_in_new_rounded,
                  filled: false,
                  onTap: onSecondButtonTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider(bool isDark) {
    return Container(
      width: 1,
      height: 48,
      color: isDark
          ? Colors.white12
          : Colors.black12,
    );
  }
}