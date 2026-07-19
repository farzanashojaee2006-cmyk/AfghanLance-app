import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main_screens/Home.dart';
import '../main_screens/welcome_page.dart';

class AuthGate extends StatelessWidget {

  static const String id = "/AuthGate";
  final VoidCallback onToggleTheme;

  const AuthGate({
    super.key,
    required this.onToggleTheme,
  });

  Future<bool?> getUserRole() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return null;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final data = doc.data();

    if (data == null) return null;

    return data['role'] == 'client';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: getUserRole(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final isClient = snapshot.data;

        if (isClient == null) {
          return WelcomePageOne(
            onToggleTheme: onToggleTheme,
          );
        }

        return HomePage(
          isClient: isClient,
        );
      },
    );
  }
}