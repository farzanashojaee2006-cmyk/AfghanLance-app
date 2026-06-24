import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

import '../../models/client_profile_model.dart';
import '../../widgets/profile_stat_item.dart';

class ClientHeader extends StatelessWidget {
  final ClientProfileModel profile;
  final VoidCallback onEditTap;
  final VoidCallback onProjectsTap;
  final bool isMyProfile;
  final VoidCallback? onMessageTap;

  const ClientHeader({
    super.key,
    required this.profile,
    required this.onEditTap,
    required this.onProjectsTap,
    this.isMyProfile = true,
    this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? Color(0xFF1A1A1A) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final subTextColor = isDark ? Colors.white60 : Colors.black54;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
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
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF0B8A87),
                      Color(0xFF38B7AF),
                      Color(0xFFA8DDD8),
                    ],
                    stops: [0.0, 0.55, 1.0],
                  ),
                ),
              ),

              Positioned.fill(child: CustomPaint(painter: HeaderWavePainter())),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: ProfileWaveClipper(),
                  child: Container(height: 95, color: cardColor),
                ),
              ),
              if (isMyProfile)
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
                        color: isDark
                            ? Colors.black.withOpacity(.35)
                            : Colors.white.withOpacity(.95),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: isDark ? kFirstColor : kThirdColor,
                        size: 21,
                      ),
                    ),
                  ),
                ),

              Positioned(
                left: 16,
                top: 58,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 58,
                      backgroundColor: cardColor,
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 142,
                right: 8,
                top: 118,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            profile.companyName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        if (profile.isVerified)
                          const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.verified,
                              color: kThirdColor,
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      profile.ownerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kThirdColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: subTextColor,
                        ),
                        SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            profile.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: subTextColor, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileStatItem(
                icon: Icons.work_outline_rounded,
                value: profile.activeProjects.toString(),
                label: "Projects",
                iconColor: kThirdColor,
              ),
              _divider(isDark),
              ProfileStatItem(
                icon: Icons.people_outline_rounded,
                value: profile.totalHires.toString(),
                label: "Hires",
                iconColor: kThirdColor,
              ),
              _divider(isDark),
              ProfileStatItem(
                icon: Icons.star_rounded,
                value: profile.rating.toString(),
                label: "Rating",
                iconColor: Colors.amber,
              ),
            ],
          ),
          if (!isMyProfile) ...[
            SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kThirdColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: onMessageTap,
                icon: const Icon(Icons.message_outlined),
                label: const Text("Message"),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _divider(bool isDark) {
    return Container(
      height: 48,
      width: 1,
      color: isDark ? Colors.white12 : Colors.black12,
    );
  }
}

class HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    path.moveTo(0, size.height * .52);

    path.cubicTo(
      size.width * .22,
      size.height * .18,
      size.width * .42,
      size.height * .78,
      size.width * .62,
      size.height * .40,
    );

    path.cubicTo(
      size.width * .78,
      size.height * .10,
      size.width * .92,
      size.height * .70,
      size.width,
      size.height * .35,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ProfileWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 45);

    path.quadraticBezierTo(size.width * .25, 5, size.width * .5, 30);

    path.quadraticBezierTo(size.width * .75, 55, size.width, 15);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
