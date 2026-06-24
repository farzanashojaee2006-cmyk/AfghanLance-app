import 'package:afghanlance/profile/freelancer/widgets/freelancer_links.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';

import '../models/freelancer_profile_model.dart';
import 'edit_freelancer_profile_page.dart';
import 'widgets/freelancer_about_section.dart';
import 'widgets/freelancer_header.dart';
import 'widgets/freelancer_portfolio_section.dart';
import 'widgets/freelancer_reviews_section.dart';
import 'widgets/freelancer_skills_section.dart';

class FreelancerProfileView extends StatefulWidget {
  final FreelancerProfileModel profile;
  final bool showBottomNav;
  final bool isMyProfile;
  final VoidCallback? onMessageTap;

  const FreelancerProfileView({
    super.key,
    required this.profile,
    this.showBottomNav = false,
    this.isMyProfile = true,
    this.onMessageTap,
  });

  @override
  State<FreelancerProfileView> createState() => _FreelancerProfileViewState();
}

class _FreelancerProfileViewState extends State<FreelancerProfileView> {
  late FreelancerProfileModel profile;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;
  }

  Future<void> openEditPage() async {
    final updated = await Navigator.push<FreelancerProfileModel>(
      context,
      MaterialPageRoute(
        builder: (_) => EditFreelancerProfilePage(profile: profile),
      ),
    );

    if (updated != null) {
      setState(() => profile = updated);
    }
  }

  void openPortfolio() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Portfolio clicked")));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Color(0xFF121212) : kFirstColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 110),
          child: Column(
            children: [
            FreelancerHeader(
            profile: profile,
            onEditTap: openEditPage,
            onPortfolioTap: openPortfolio,
            isMyProfile: widget.isMyProfile,
            onMessageTap: widget.onMessageTap,
          ),
              SizedBox(height: 18),
              FreelancerAboutSection(profile: profile),
              SizedBox(height: 18),
              FreelancerSkillsSection(profile: profile),
              SizedBox(height: 18),
              FreelancerLinksSection(profile: profile),
              SizedBox(height: 18),
              FreelancerPortfolioSection(profile: profile),
              SizedBox(height: 18),
              FreelancerReviewsSection(profile: profile),
            ],
          ),
        ),
      ),
    );

  }
}
