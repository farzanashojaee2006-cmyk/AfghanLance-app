import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../messenger/pages/chat_page.dart';
import 'client/client_profile_view.dart';
import 'freelancer/freelancer_profile_view.dart';
import 'services/profile_service.dart';

class ProfilePage extends StatelessWidget {
  static const String id="/ProfilePage";
  final bool? isClient;
  final bool showBottomNav;
  final String? userId;

  const ProfilePage({
    super.key,
     this.isClient,
    this.showBottomNav = false,
    this.userId,
  });

  Future<Map<String, dynamic>?> getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) return null;

    final profileUserId = userId ?? currentUser.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(profileUserId)
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
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final data = snapshot.data;
        final currentUserId = FirebaseAuth.instance.currentUser!.uid;
        final profileUserId = userId ?? currentUserId;
        final isMyProfile = profileUserId == currentUserId;

        if (data == null) {
          return const Scaffold(
            body: Center(child: Text("User data not found")),
          );
        }

        final role = data['role'];
        final currentIsClient = role == 'client';

        if (currentIsClient) {
          final List<String> categories = List<String>.from(
            data['categories'] ?? [],
          );

          final profile = ProfileService.getClientProfile().copyWith(
            companyName: "${data['firstName'] ?? ''} ${data['lastName'] ?? ''}"
                .trim(),
            ownerName: data['username'] ?? '',
            location: data['country'] ?? '',
            imageUrl: data['profileImage'] ?? 'assets/images/profile.png',
            about: data['about'] ?? '',
            categories: categories,
          );

          return ClientProfileView(
            profile: profile,
            showBottomNav: showBottomNav,
            isMyProfile: isMyProfile,
            onMessageTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(
                    userName: profile.companyName,
                    isOnline: false,
                    otherUserId: profileUserId,
                  ),
                ),
              );
            },
          );
        }

        final List<String> skills = List<String>.from(data['skills'] ?? []);

        final profile = ProfileService.getFreelancerProfile().copyWith(
          name: "${data['firstName'] ?? ''} ${data['lastName'] ?? ''}".trim(),
          title: data['title'] ?? '',
          location: data['country'] ?? '',
          imageUrl: data['profileImage'] ?? 'assets/images/profile.png',
          about: data['about'] ?? '',
          skills: skills,
          topSkills: skills.take(5).toList(),
          portfolioLink: data['links'] ?? '',
          isVerified: data['isVerified'] ?? false,
        );

        return FreelancerProfileView(
          profile: profile,
          showBottomNav: showBottomNav,
          isMyProfile: isMyProfile,
          onMessageTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatPage(
                  userName: profile.name,
                  isOnline: false,
                  otherUserId: profileUserId,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
