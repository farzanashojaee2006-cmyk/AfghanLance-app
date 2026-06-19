import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'client/client_profile_view.dart';
import 'freelancer/freelancer_profile_view.dart';
import 'services/profile_service.dart';

class ProfilePage extends StatelessWidget {
  final bool isClient;
  final bool showBottomNav;

  const ProfilePage({
    super.key,
    required this.isClient,
    this.showBottomNav= false
  });

  Future<Map<String, dynamic>?> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return null;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    return doc.data();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final data = snapshot.data;

        if (data == null) {
          return const Scaffold(
            body: Center(
              child: Text("User data not found"),
            ),
          );
        }

        final role = data['role'];
        final currentIsClient = role == 'client';

        if (currentIsClient) {
          final List<String> categories =
          List<String>.from(data['categories'] ?? []);

          final profile = ProfileService.getClientProfile().copyWith(
            companyName:
            "${data['firstName'] ?? ''} ${data['lastName'] ?? ''}".trim(),
            ownerName: data['username'] ?? '',
            location: data['country'] ?? '',
            imageUrl:
            data['profileImage'] ?? 'assets/images/profile.png',
            about: data['about'] ?? '',
            categories: categories,
          );

          return ClientProfileView(
            profile: profile,
            showBottomNav: showBottomNav,
          );
        }

        final List<String> skills =
        List<String>.from(data['skills'] ?? []);

        final profile = ProfileService.getFreelancerProfile().copyWith(
          name:
          "${data['firstName'] ?? ''} ${data['lastName'] ?? ''}".trim(),
          title: data['title'] ?? '',
          location: data['country'] ?? '',
          imageUrl:
          data['profileImage'] ?? 'assets/images/profile.png',
          about: data['about'] ?? '',
          skills: skills,
          topSkills: skills.take(5).toList(),
          portfolioLink: data['links'] ?? '',
          isVerified: data['isVerified'] ?? false,
        );

        return FreelancerProfileView(
          profile: profile,
          showBottomNav: showBottomNav,
        );
      },
    );
  }
}