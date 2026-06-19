import 'package:afghanlance/profile/client/widgets/client_header.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';
import '../models/client_profile_model.dart';
import 'edit_client_profile_page.dart';
import 'widgets/client_about_section.dart';
import 'widgets/client_categories_section.dart';
import 'widgets/client_projects_section.dart';
import 'widgets/client_reviews_section.dart';

class ClientProfileView extends StatefulWidget {
  final ClientProfileModel profile;
  final bool showBottomNav;

  const ClientProfileView({
    super.key,
    required this.profile,
    this.showBottomNav= false
  });

  @override
  State<ClientProfileView> createState() => _ClientProfileViewState();
}

class _ClientProfileViewState extends State<ClientProfileView> {
  late ClientProfileModel profile;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;
  }

  Future<void> openEditPage() async {
    final updated = await Navigator.push<ClientProfileModel>(
      context,
      MaterialPageRoute(
        builder: (_) => EditClientProfilePage(profile: profile),
      ),
    );

    if (updated != null) {
      setState(() => profile = updated);
    }
  }

  void openProjects() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Projects clicked")),
    );
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
              ClientHeader(
                profile: profile,
                onEditTap: openEditPage,
                onProjectsTap: openProjects,
              ),
               SizedBox(height: 18),
              ClientAboutSection(profile: profile),
               SizedBox(height: 18),
              ClientCategoriesSection(profile: profile),
               SizedBox(height: 18),
              ClientProjectsSection(profile: profile),
               SizedBox(height: 18),
              ClientReviewsSection(profile: profile),
            ],
          ),
        ),
      ),
    );
  }
}